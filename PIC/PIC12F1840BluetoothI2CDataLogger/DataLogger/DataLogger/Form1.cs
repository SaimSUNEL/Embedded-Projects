using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DataLogger
{
    public partial class Form1 : Form
    {

        enum MESSAGE_TYPE {IMAGE, TEXT, SOUND};
        struct MESSAGE
        {

            byte message_id;
            int message_size;
            byte message_type;


        };


        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
           
            timer1.Enabled = true;
            byte[] data = new byte[65536];
            for (int a = 0; a < 65536; a++)
                data[a] = (byte)(a % 256);
            
            byte [] command = new byte[1];
            command[0] =(byte) '1';
            serialPort1.Write(command, 0, 1);

            for(int sector_index = 0; sector_index < 2048; sector_index++)
            {
                int current_adress = sector_index * 32;
                progressBar1.Value = (sector_index * 100 / 2048);
                label2.Text = "Sent byte : " + sector_index;

                for (int i = 0; i < 32; i++)
                {
                    command[0] = data[current_adress + i];
                    serialPort1.Write(command, 0, 1);
                    System.Threading.Thread.Sleep(1);
                    serialPort1.Read(command, 0, 1);
                    if (command[0] != 'T')
                    {
                        MessageBox.Show("Send error");
                    }
                }
               
            }


            timer1.Enabled = false ;
            MessageBox.Show("Data sent");
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            serialPort1.Open();
        }

        private int count = 0;
        private void timer1_Tick(object sender, EventArgs e)
        {
            count++;
            label1.Text = "Saniye: " + count;
        }
    }
}
