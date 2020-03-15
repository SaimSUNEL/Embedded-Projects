using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.IO;

using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;

namespace NewAlarmDevresi
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            serialPort1.Open();

            for (int a = 0; a < 60; a++)
            {
                if (a < 8)
                    comboBox6.Items.Add("" + a);

                if (a < 24)
                {
                    saatBox.Items.Add("" + (a / 10) + (a % 10));
                    comboBox1.Items.Add("" + (a / 10) + (a % 10));

                }
                dakikaBox.Items.Add("" + (a / 10) + (a % 10));
                comboBox2.Items.Add("" + (a / 10) + (a % 10));
                comboBox3.Items.Add("" + (a / 10) + (a % 10));

            }
            saatBox.SelectedIndex = 0;
            dakikaBox.SelectedIndex = 0;

            comboBox1.SelectedIndex = 1;
            comboBox2.SelectedIndex = 0;
            comboBox3.SelectedIndex = 0;

            comboBox6.SelectedIndex = 0;

        }
        ~Form1()
        {
            serialPort1.Close();


        }

        private void button1_Click(object sender, EventArgs e)
        {
            //Daha önceki sorgudan kalan veriyi temizliyoruz...
            if (listBox1.Items.Count > 0)
            {
                listBox1.Items.Clear();
                comboBox4.Items.Clear();
                comboBox5.Items.Clear();

            }



            bool success = false;
            byte[] data = { (byte)'R' };
            int alarm_id, alarm_saati, alarm_dakikası, alarm_gunu, alarm_ayı, alarm_yılı, mesaj_sayısı;

            int received_byte;
            //To get all the alarms we must send first '4'
            data[0] = (byte)'R';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(10);
            received_byte = serialPort1.ReadByte();


            int alarm_count = (serialPort1.ReadByte());
            data[0] = (byte)'T';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(10);

            for (int j = 0; j < alarm_count; j++)
            {

                alarm_id = serialPort1.ReadByte();
                data[0] = (byte)'T';
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);

                alarm_yılı = serialPort1.ReadByte();
                data[0] = (byte)'T';
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);

                alarm_ayı = serialPort1.ReadByte();
                data[0] = (byte)'T';
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);

                alarm_gunu = serialPort1.ReadByte();
                data[0] = (byte)'T';
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);

                alarm_saati = serialPort1.ReadByte();
                data[0] = (byte)'T';
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);

                alarm_dakikası = serialPort1.ReadByte();
                data[0] = (byte)'T';
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);

                mesaj_sayısı = serialPort1.ReadByte() & 0xf;
                data[0] = (byte)'T';
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);


                listBox1.Items.Add("" + alarm_id + " " + alarm_saati + ":" + alarm_dakikası + " - " + alarm_gunu + "/" + alarm_ayı + "/" + alarm_yılı + " - " + mesaj_sayısı);
                comboBox4.Items.Add("" + alarm_id + " " + alarm_saati + ":" + alarm_dakikası + " - " + alarm_gunu + "/" + alarm_ayı + "/" + alarm_yılı + " - " + mesaj_sayısı);
                comboBox5.Items.Add("" + alarm_id + " " + alarm_saati + ":" + alarm_dakikası + " - " + alarm_gunu + "/" + alarm_ayı + "/" + alarm_yılı + " - " + mesaj_sayısı);
            }
            serialPort1.ReadByte();



            if (listBox1.Items.Count == 0)
                MessageBox.Show("There is no saved alarms");
            else
            {
                comboBox4.SelectedIndex = 0;
                comboBox5.SelectedIndex = 0;
            }




        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

            bool successful = false;
            //MessageBox.Show("" + dateTimePicker1.Value);
            DateTime date = dateTimePicker1.Value;
            byte gün = (byte)date.Day, ay = (byte)date.Month, yıl = (byte)(date.Year - 2000);
            byte saat = Byte.Parse(saatBox.Text);
            byte dakika = Byte.Parse(dakikaBox.Text);
            //MessageBox.Show("Tarih : " + gün+"/"+ay+"/"+yıl + " - - " + saat + ":" + dakika);
            byte[] data = { (byte)'A' };
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(10);
            if ((char)serialPort1.ReadByte() == 'T')
            {

                data[0] = 0;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(20);
                serialPort1.ReadByte();

                //id is decided via PIC
                data[0] = 6;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(20);
                serialPort1.ReadByte();

                data[0] = yıl;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(20);
                serialPort1.ReadByte();


                data[0] = ay;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(20);
                serialPort1.ReadByte();

                data[0] = gün;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(20);
                serialPort1.ReadByte();


                data[0] = saat;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(20);
                serialPort1.ReadByte();

                data[0] = dakika;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(20);
                serialPort1.ReadByte();


                data[0] = 0;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(20);
                serialPort1.ReadByte();


                if ((char)serialPort1.ReadByte() == 'T')
                {
                    successful = true;

                }

            }
            if (successful == true)
                MessageBox.Show("Your alarm has been saved succesfully");
            else MessageBox.Show("Error occured while saving alarm");

        }

        private void button3_Click(object sender, EventArgs e)
        {
            bool success = false;
            byte[] data = new byte[1];
            // MessageBox.Show(""+listBox1.SelectedIndex);
            if (listBox1.SelectedIndex == -1)
            {
                MessageBox.Show("Please select and alarm to delete");
                return;
            }

            data[0] = (byte)'D';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(20);
            if ((char)serialPort1.ReadByte() == 'T')
            {
                //PIC te alarm indexi 1 den başlıyor....
                string g = listBox1.SelectedItem.ToString();
                string[] o = g.Split(' ');
                data[0] = (byte)Convert.ToInt32(o[0]);
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(20);
                if ((char)serialPort1.ReadByte() == 'T')
                {
                    success = true;

                }

            }
            if (success == true)
                MessageBox.Show("Alarm has beem deleted...");
            else MessageBox.Show("Error occured while deleting alarm");
            comboBox4.Items.RemoveAt(listBox1.SelectedIndex);
            comboBox5.Items.RemoveAt(listBox1.SelectedIndex);

            listBox1.Items.RemoveAt(listBox1.SelectedIndex);

        }

        private void button4_Click(object sender, EventArgs e)
        {
            bool success = false;
            byte[] data = new byte[1];
            data[0] = (byte)'C';
            serialPort1.Write(data, 0, 1);
            if ((char)serialPort1.ReadByte() == 'T')
            {
                if ((char)serialPort1.ReadByte() == 'T')
                {
                    success = true;
                }
            }

            if (success == false)
            {
                MessageBox.Show("Error occured while deleting all alarms...");
            }
            else MessageBox.Show("Alarms erased...");


        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            bool success = false;
            DateTime tarih = dateTimePicker2.Value;
            byte gün = (byte)tarih.Day, ay = (byte)tarih.Month, yıl = (byte)(tarih.Year - 2000);
            byte[] data = new byte[1];
            data[0] = (byte)'N';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(20);
            if ((char)serialPort1.ReadByte() == 'T')
            {

                data[0] = 0;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();


                data[0] = 3;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();




                data[0] = (byte)(((gün / 10) << 4) + (gün % 10));
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();

                data[0] = (byte)(((ay / 10) << 4) + (ay % 10));
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();

                data[0] = (byte)(((yıl / 10) << 4) + (yıl % 10));
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();

                if ((char)serialPort1.ReadByte() == 'T')
                {
                    success = true;
                }

            }
            if (success == false)
            {
                MessageBox.Show("Error occured while setting date information...");
                return;
            }

        }

        private void button6_Click(object sender, EventArgs e)
        {

            bool success = false;
            DateTime tarih = DateTime.Now;
            byte gün = (byte)tarih.Day, ay = (byte)tarih.Month, yıl = (byte)(tarih.Year - 2000);
            byte[] data = new byte[1];
            data[0] = (byte)'N';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(20);
            if ((char)serialPort1.ReadByte() == 'T')
            {

                data[0] = 0;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();


                data[0] = 3;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();




                data[0] = (byte)(((gün / 10) << 4) + (gün % 10));
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();

                data[0] = (byte)(((ay / 10) << 4) + (ay % 10));
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();

                data[0] = (byte)(((yıl / 10) << 4) + (yıl % 10));
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();

                if ((char)serialPort1.ReadByte() == 'T')
                {
                    success = true;
                }

            }
            if (success == false)
            {
                MessageBox.Show("Error occured while setting date information...");
                return;
            }



        }

        private void button7_Click(object sender, EventArgs e)
        {
            DateTime current = DateTime.Now;

            bool success = false;
            byte saat = (byte)current.Hour, dakika = (byte)current.Minute, saniye = (byte)current.Second;
            byte[] data = new byte[1];
            data[0] = (byte)'U';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(20);
            if ((char)serialPort1.ReadByte() == 'T')
            {

                data[0] = 0;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();


                data[0] = 3;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();

                data[0] = (byte)(((saniye / 10) << 4) + (saniye % 10));
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();

                data[0] = (byte)(((dakika / 10) << 4) + (dakika % 10));
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();


                data[0] = (byte)(((saat / 10) << 4) + (saat % 10));
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();


                if ((char)serialPort1.ReadByte() == 'T')
                {
                    success = true;
                }

            }
            if (success == false)
            {
                MessageBox.Show("Error occured while setting time information...");
                return;
            }

        }

        private void button8_Click(object sender, EventArgs e)
        {
            bool success = false;
            byte saat = Byte.Parse(comboBox1.Text), dakika = Byte.Parse(comboBox2.Text), saniye = Byte.Parse(comboBox3.Text);

            byte[] data = new byte[1];
            data[0] = (byte)'U';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(20);
            if ((char)serialPort1.ReadByte() == 'T')
            {

                data[0] = 0;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();


                data[0] = 3;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();

                data[0] = (byte)(((saniye / 10) << 4) + (saniye % 10));
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();

                data[0] = (byte)(((dakika / 10) << 4) + (dakika % 10));
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();


                data[0] = (byte)(((saat / 10) << 4) + (saat % 10));
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();


                if ((char)serialPort1.ReadByte() == 'T')
                {
                    success = true;
                }

            }
            if (success == false)
            {
                MessageBox.Show("Error occured while setting time information...");
                return;
            }


        }

        private void button11_Click(object sender, EventArgs e)
        {
            bool success = false;
            byte[] data = new byte[1];
            int sıcaklık = 0, nem = 0;
            data[0] = (byte)'B';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(20);
            if ((char)serialPort1.ReadByte() == 'T')
            {
                sıcaklık = serialPort1.ReadByte();
                data[0] = (byte)'T';
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(20);

                nem = serialPort1.ReadByte();
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(20);
                if ((char)serialPort1.ReadByte() == 'T')
                {
                    success = true;
                }

            }
            if (success == false)
            {
                MessageBox.Show("Error while retrieving temperature and moisture information...");
                return;
            }

            label6.Text = "Sıcaklık: " + sıcaklık + " Nem: " + nem;

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void button10_Click(object sender, EventArgs e)
        {
            bool success = false;

            byte[] data = new byte[1];

            data[0] = (byte)'!';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(20);
            if ((char)serialPort1.ReadByte() == 'T')
            {

                data[0] = (byte)((7 << 4) + 1);
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(20);
                serialPort1.ReadByte();


                serialPort1.ReadByte();

                success = true;
            }
            else success = false;

            if (success == false)
            {
                MessageBox.Show("Error while turning led on alarm...");
                return;
            }



        }

        private void button9_Click(object sender, EventArgs e)
        {
            bool success = false;

            byte[] data = new byte[1];

            data[0] = (byte)'!';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(20);
            if ((char)serialPort1.ReadByte() == 'T')
            {

                data[0] = (byte)(7 << 4 + 0);

                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(20);
                serialPort1.ReadByte();



                serialPort1.ReadByte();


                success = true;
            }
            else success = false;

            if (success == false)
            {
                MessageBox.Show("Error while turning led on alarm...");
                return;
            }

        }

        private void button12_Click(object sender, EventArgs e)
        {

            string alarm = comboBox4.Text;
            string[] jj = alarm.Split(' ');
            //            MessageBox.Show(jj[0]);

            byte related_alarm = (byte)Convert.ToInt32(jj[0]);//(comboBox4.SelectedIndex +1);//Alarms start from 1
            byte message_length = (byte)richTextBox1.Text.Length;

            if (message_length > 64)
            {
                MessageBox.Show("Message exceeds 64 charachters....");
                return;
            }

            char[] metin = richTextBox1.Text.ToCharArray();

            bool success = true;

            byte[] data = new byte[1];

            data[0] = (byte)'M';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(20);
            string hata = "";

            if ((char)serialPort1.ReadByte() == 'T')
            {
                //  MessageBox.Show("First T");
                data[0] = related_alarm;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(5);

                if ((char)serialPort1.ReadByte() == 'T')
                {
                    //  MessageBox.Show("related alarm T");
                    data[0] = 0;
                    serialPort1.Write(data, 0, 1);
                    System.Threading.Thread.Sleep(5);
                    serialPort1.ReadByte();

                    data[0] = message_length;
                    serialPort1.Write(data, 0, 1);
                    System.Threading.Thread.Sleep(5);
                    if ((char)serialPort1.ReadByte() == 'T')
                    {
                        //  MessageBox.Show("Message length T");
                        //data gönderilecek tüm buffering işleri burada yapılacak buffer dolduma olarak 0 kullanılacak...
                        int byte_sent = 0;
                        for (; byte_sent < message_length; byte_sent++)
                        {
                            data[0] = (byte)metin[byte_sent];
                            serialPort1.Write(data, 0, 1);
                            System.Threading.Thread.Sleep(5);
                            serialPort1.ReadByte();

                            //   else MessageBox.Show("data T");



                        }//for(;;),

                        serialPort1.ReadByte();
                        success = true;


                    }

                }

            }

            if (success == false)
            {
                MessageBox.Show("Error while saving alarm note...Errr : " + hata);
                return;
            }
            else
            {
                MessageBox.Show("Your Message has been saved...");
            }




        }

        ArrayList liste = new ArrayList();
        Dictionary<int, ArrayList> dictionary = new Dictionary<int, ArrayList>();


        private void button13_Click(object sender, EventArgs e)
        {

            ArrayList arr = new ArrayList();
            bool success = true;
            string hata = "";
            string id = comboBox5.Text;
            string[] m = id.Split(' ');


            byte alarm_index = (byte)Convert.ToInt32(m[0]);//(byte)(comboBox5.SelectedIndex + 1);
            string message = "";


            byte[] data = new byte[1];

            data[0] = (byte)'S';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(10);
            if ((char)serialPort1.ReadByte() == 'T')
            {

                data[0] = alarm_index;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                if ((char)serialPort1.ReadByte() == 'T')
                {

                    int mesaj_sayısı = serialPort1.ReadByte() & 0xf;
                    System.Threading.Thread.Sleep(3);
                    data[0] = (byte)'T';
                    serialPort1.Write(data, 0, 1);
                    System.Threading.Thread.Sleep(10);


                    for (int index = 0; index < mesaj_sayısı; index++)
                    {
                        message = "";
                        int mess_id = serialPort1.ReadByte();
                        System.Threading.Thread.Sleep(10);

                        data[0] = (byte)'T';
                        serialPort1.Write(data, 0, 1);
                        System.Threading.Thread.Sleep(10);



                        int mess_size = serialPort1.ReadByte();
                        System.Threading.Thread.Sleep(13);

                        data[0] = (byte)'T';
                        serialPort1.Write(data, 0, 1);
                        System.Threading.Thread.Sleep(15);


                        for (int j = 0; j < mess_size; j++)
                        {
                            message += (char)serialPort1.ReadByte();
                            System.Threading.Thread.Sleep(13);

                            data[0] = (byte)'T';
                            serialPort1.Write(data, 0, 1);
                            System.Threading.Thread.Sleep(15);
                        }
                        arr.Add("" + mess_id + " - " + message);


                    }
                    serialPort1.ReadByte();





                }
                else
                {
                    success = false; hata = "alarm index T error";

                }



            }
            else
            {
                success = false; hata = "First T error";

            }






            dictionary[alarm_index] = arr;
            listBox2.Items.Clear();
            foreach (string mess in dictionary[alarm_index])
            {
                listBox2.Items.Add("" + mess + "\n");


            }


        }

        private void button14_Click(object sender, EventArgs e)
        {
            bool success = true;
            string hata = "";
            byte[] data = new byte[1];
            string y = comboBox5.Items[comboBox5.SelectedIndex].ToString();
            string[] jj = y.Split(' ');
            byte alarm_index = (byte)Convert.ToInt32(jj[0]);
            y = listBox2.Items[listBox2.SelectedIndex].ToString();

            string[] p = y.Split(' ');
            byte alarm_note_index = (byte)Convert.ToInt32(p[0]);

            data[0] = (byte)'J';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(10);
            if ((char)serialPort1.ReadByte() == 'T')
            {
                //MessageBox.Show("First T");
                data[0] = alarm_index;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(5);
                if ((char)serialPort1.ReadByte() == 'T')
                {
                    // MessageBox.Show("alarm index T");
                    data[0] = alarm_note_index;
                    serialPort1.Write(data, 0, 1);
                    System.Threading.Thread.Sleep(5);
                    if ((char)serialPort1.ReadByte() == 'T')
                    {
                        // MessageBox.Show("alarm note T");

                        if ((char)serialPort1.ReadByte() == 'T')
                        {
                            // MessageBox.Show("Last T");
                            success = true;


                        }
                        else
                        {
                            hata = "son T hata";
                            success = false;
                        }

                    }
                    else
                    {
                        hata = "alarm note index T hata";
                        success = false;
                    }


                }
                else
                {
                    hata = "alarm index T hata";
                    success = false;
                }



            }
            else
            {
                hata = "Ilk T hata";
                success = false;
            }


            if (success == false)
            {
                MessageBox.Show("Error while reading alarm note...Errr : " + hata);
                return;
            }

            listBox2.Items.RemoveAt(listBox2.SelectedIndex);
            MessageBox.Show("Message deleted....");

        }


        public static List<KeyValuePair<string, decimal>> GetCurrencyListFromWeb(out DateTime currencyDate)
        {
            List<KeyValuePair<string, decimal>> returnList = new List<KeyValuePair<string, decimal>>();
            string date = string.Empty;
            using (XmlReader xmlr = XmlReader.Create(@"http://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml"))
            {
                xmlr.ReadToFollowing("Cube");
                while (xmlr.Read())
                {
                    if (xmlr.NodeType != XmlNodeType.Element) continue;
                    if (xmlr.GetAttribute("time") != null)
                    {
                        date = xmlr.GetAttribute("time");
                    }
                    else returnList.Add(new KeyValuePair<string, decimal>(xmlr.GetAttribute("currency"), decimal.Parse(xmlr.GetAttribute("rate"))));
                }
                currencyDate = DateTime.Parse(date);
            }
            returnList.Add(new KeyValuePair<string, decimal>("EUR", 1));
            return returnList;
        }




        private void button15_Click(object sender, EventArgs e)
        {



        }

        private void dolarAyarlaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            List<KeyValuePair<string, decimal>> money = null;
            DateTime now = new DateTime();

            Decimal dolar = 1, tl = 1;




            money = GetCurrencyListFromWeb(out now);
            KeyValuePair<string, decimal> val;
            foreach (KeyValuePair<string, decimal> element in money)
            {
                if (element.Key == "USD")
                {
                    dolar = element.Value;
                }

                if (element.Key == "TRY")
                {
                    tl = element.Value;
                }
            }

            string str_form = "" + (tl / dolar);
            str_form = str_form.Substring(0, 4);
            str_form += "    ";

            char[] arr = str_form.ToCharArray();

            MessageBox.Show("1 $ = " + str_form + " TL");

            bool success = false;
            byte[] data = new byte[1];

            data[0] = (byte)'K';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(10);
            if ((char)serialPort1.ReadByte() == 'T')
            {

                for (int j = 0; j < 8; j++)
                {
                    data[0] = (byte)arr[j];
                    serialPort1.Write(data, 0, 1);
                    System.Threading.Thread.Sleep(10);

                }



                if ((char)serialPort1.ReadByte() == 'T')
                {
                    success = true;
                }




            }
            System.Threading.Thread.Sleep(250);

            data[0] = (byte)'L';
            str_form = "Dolar   ";
            arr = str_form.ToCharArray();
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(10);
            if ((char)serialPort1.ReadByte() == 'T')
            {
                for (int j = 0; j < 8; j++)
                {
                    data[0] = (byte)arr[j];
                    serialPort1.Write(data, 0, 1);
                    System.Threading.Thread.Sleep(10);

                }


                if ((char)serialPort1.ReadByte() == 'T')
                {
                    success = true;
                }
                else success = false;





            }





            if (success == false)
            {

                MessageBox.Show("Dolar information could not be sent...");
                return;

            }

            MessageBox.Show("Dolar information has been sent...");
        }

        private void groupBox9_Enter(object sender, EventArgs e)
        {

        }



        void setInformation()
        {

        }

        private void button15_Click_1(object sender, EventArgs e)
        {
            bool success = false;

            string üst_bilgi = textBox1.Text;
            if (üst_bilgi.Length < 8)
            {
                for (int a = üst_bilgi.Length; a < 8; a++)
                    üst_bilgi += " ";
            }
            else if (üst_bilgi.Length > 8)
            {
                MessageBox.Show("Please enter 8 characters at most");
                return;
            }


            üst_bilgi = üst_bilgi;

            char[] info = üst_bilgi.ToCharArray();
            byte[] data = new byte[1];
            data[0] = (byte)'#';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(20);
            if ((char)serialPort1.ReadByte() == 'T')
            {
                data[0] = 0;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();

                data[0] = 16;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();

                for (int k = 0; k < 16; k++)
                {
                    if (k >= 8) data[0] = (byte)0xff;
                    else
                        data[0] = (byte)info[k];
                    serialPort1.Write(data, 0, 1);
                    System.Threading.Thread.Sleep(10);
                    serialPort1.ReadByte();
                }


                if ((char)serialPort1.ReadByte() == 'T')
                {
                    success = true;
                }

            }
            if (success == false)
            {
                MessageBox.Show("Error occured while setting information...");
                return;
            }

            MessageBox.Show("Extra information is added...");
        }

        private void button16_Click(object sender, EventArgs e)
        {
            bool success = false;

            string alt_bilgi = textBox2.Text;
            if (alt_bilgi.Length < 8)
            {
                for (int a = alt_bilgi.Length; a < 8; a++)
                    alt_bilgi += " ";
            }
            else if (alt_bilgi.Length > 8)
            {
                MessageBox.Show("Please enter 8 characters at most");
                return;
            }



            char[] info = alt_bilgi.ToCharArray();
            byte[] data = new byte[1];
            data[0] = (byte)'#';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(20);
            if ((char)serialPort1.ReadByte() == 'T')
            {

                data[0] = 0;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();

                data[0] = 16;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();



                for (int k = 0; k < 16; k++)
                {
                    if (k < 8) data[0] = (byte)0xff;
                    else
                        data[0] = (byte)info[k - 8];
                    serialPort1.Write(data, 0, 1);
                    System.Threading.Thread.Sleep(10);
                    serialPort1.ReadByte();
                }


                if ((char)serialPort1.ReadByte() == 'T')
                {
                    success = true;
                }

            }
            if (success == false)
            {
                MessageBox.Show("Error occured while setting information...");
                return;
            }

            MessageBox.Show("Extra information is added...");
        }

        private void button18_Click(object sender, EventArgs e)
        {
            bool success = false;
            byte pin = Byte.Parse(comboBox6.Text);
            int adc_result = 0;
            byte[] data = new byte[1];
            data[0] = (byte)'V';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(20);
            if ((char)serialPort1.ReadByte() == 'T')
            {

                data[0] = pin;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();



                adc_result = serialPort1.ReadByte();



                data[0] = (byte)'T';
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);


                adc_result += serialPort1.ReadByte() << 8;



                data[0] = (byte)'T';
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);

                if ((char)serialPort1.ReadByte() == 'T')
                {
                    success = true;
                }

            }
            if (success == false)
            {
                MessageBox.Show("Error occured while setting time information...");
                return;
            }

            textBox4.Text = "" + adc_result;
            textBox3.Text = "" + (5.0 * adc_result / 1024.0) + " V";


        }

        private void label11_Click(object sender, EventArgs e)
        {

        }

        private void button17_Click(object sender, EventArgs e)
        {
            bool success = false;
            byte pin = Byte.Parse(comboBox6.Text);
            int[] thresholds = new int[4];
            int adc_result = 0;
            byte[] data = new byte[1];
            data[0] = (byte)'Y';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(20);
            if ((char)serialPort1.ReadByte() == 'T')
            {
                for (int k = 0; k < 4; k++)
                {
                    thresholds[k] = serialPort1.ReadByte();
                    data[0] = (byte)'T';
                    serialPort1.Write(data, 0, 1);
                    System.Threading.Thread.Sleep(10);

                    thresholds[k] += serialPort1.ReadByte() << 8;
                    data[0] = (byte)'T';
                    serialPort1.Write(data, 0, 1);
                    System.Threading.Thread.Sleep(10);
                }






                if ((char)serialPort1.ReadByte() == 'T')
                {
                    success = true;
                }

            }
            if (success == false)
            {
                MessageBox.Show("Error occured while setting time information...");
                return;
            }

            listBox3.Items.Clear();
            for (int k = 0; k < 4; k++)
            {
                listBox3.Items.Add("Sensör " + (k + 1) + " : " + thresholds[k]);

            }

        }

        private void listBox3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void listBox3_MouseClick(object sender, MouseEventArgs e)
        {
            string chosen = listBox3.Items[listBox3.SelectedIndex].ToString();
            string[] parts = chosen.Split(' ');
            string ls = parts[parts.Length - 1];
            string input = Microsoft.VisualBasic.Interaction.InputBox("Lütfen limit değeri giriniz : ", "Limit Değer Ayarlama", ls, 0, 0);
            listBox3.Items[listBox3.SelectedIndex] = "Sensör " + (listBox3.SelectedIndex + 1) + " : " + input;
        }

        private void button19_Click(object sender, EventArgs e)
        {
            bool success = false;
            int[] thresholds = new int[4];
            for (int k = 0; k < 4; k++)
            {
                string val = listBox3.Items[k].ToString();
                string[] par = val.Split(' ');
                val = par[par.Length - 1];
                thresholds[k] = Convert.ToInt32(val);

            }

            byte[] data = new byte[1];
            data[0] = (byte)'L';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(20);
            if ((char)serialPort1.ReadByte() == 'T')
            {


                data[0] = (byte)0;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();

                data[0] = (byte)8;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(10);
                serialPort1.ReadByte();

                for (int k = 0; k < 4; k++)
                {

                    data[0] = (byte)(thresholds[k] & 0xff);
                    serialPort1.Write(data, 0, 1);
                    System.Threading.Thread.Sleep(10);
                    serialPort1.ReadByte();

                    data[0] = (byte)((thresholds[k] >> 8) & 0xff);
                    serialPort1.Write(data, 0, 1);
                    System.Threading.Thread.Sleep(10);
                    serialPort1.ReadByte();

                }






                if ((char)serialPort1.ReadByte() == 'T')
                {
                    success = true;
                }

            }
            if (success == false)
            {
                MessageBox.Show("Error occured while setting time information...");
                return;
            }

            MessageBox.Show("Thrresholds have been set...");
        }

        private void lCDLedOnToolStripMenuItem_Click(object sender, EventArgs e)
        {
            bool success = false;

            byte[] data = new byte[1];

            data[0] = (byte)'!';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(20);
            if ((char)serialPort1.ReadByte() == 'T')
            {

                data[0] = (byte)1;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(20);
                serialPort1.ReadByte();

                serialPort1.ReadByte();

                success = true;
            }
            else success = false;

            if (success == false)
            {
                MessageBox.Show("Error while turning led on alarm...");
                return;
            }

        }

        private void lCDLedOffToolStripMenuItem_Click(object sender, EventArgs e)
        {
            bool success = false;

            byte[] data = new byte[1];

            data[0] = (byte)'!';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(20);
            if ((char)serialPort1.ReadByte() == 'T')
            {

                data[0] = (byte)0;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(20);
                serialPort1.ReadByte();

                serialPort1.ReadByte();

                success = true;
            }
            else success = false;

            if (success == false)
            {
                MessageBox.Show("Error while turning led on alarm...");
                return;
            }

        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void button20_Click(object sender, EventArgs e)
        {
            bool success = false;

            byte[] data = new byte[1];

            data[0] = (byte)'*';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(20);
            if ((char)serialPort1.ReadByte() == 'T')
            {
                byte value = 0;
                if (checkBox1.Checked) value |= 1;
                if (checkBox2.Checked) value |= 1 << 1;
                if (checkBox3.Checked) value |= 1 << 2;
                if (checkBox4.Checked) value |= 1 << 3;
                if (checkBox5.Checked) value |= 1 << 4;
                if (checkBox6.Checked) value |= 1 << 5;
                if (checkBox7.Checked) value |= 1 << 6;
                if (checkBox8.Checked) value |= 1 << 7;


                data[0] = (byte)value;
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(20);
                serialPort1.ReadByte();

                serialPort1.ReadByte();

                success = true;
            }
            else success = false;

            if (success == false)
            {
                MessageBox.Show("Error while setting pins...");
                return;
            }

        }

        private void button21_Click(object sender, EventArgs e)
        {
            bool success = false;

            byte[] data = new byte[1];
            int value = 0;
            data[0] = (byte)'-';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(20);
            if ((char)serialPort1.ReadByte() == 'T')
            {
                value = serialPort1.ReadByte();


                data[0] = (byte)'T';
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(20);


                serialPort1.ReadByte();

                success = true;
            }
            else success = false;

            if (success == false)
            {
                MessageBox.Show("Error while getting pin values...");
                return;
            }

            if ((value & 0x1) > 0) checkBox1.Checked = true;
            if ((value & (1 << 1)) > 0) checkBox2.Checked = true;
            if ((value & (1 << 2)) > 0) checkBox3.Checked = true;
            if ((value & (1 << 3)) > 0) checkBox4.Checked = true;
            if ((value & (1 << 4)) > 0) checkBox5.Checked = true;
            if ((value & (1 << 5)) > 0) checkBox6.Checked = true;
            if ((value & (1 << 6)) > 0) checkBox7.Checked = true;
            if ((value & (1 << 7)) > 0) checkBox8.Checked = true;


        }

        private void şiirYükleToolStripMenuItem_Click(object sender, EventArgs e)
        {
            openFileDialog1.ShowDialog();
            MessageBox.Show("Selected file : " + openFileDialog1.FileName);
            byte[] all_data = File.ReadAllBytes(openFileDialog1.FileName);
            int valid_byte_count = 0;

            for (int k = 0; k < all_data.Length; k++)
            {
                if (all_data[k] == '\n' || all_data[k] == '\t' || all_data[k] == '\r') ;
                else
                {
                    valid_byte_count++;

                }
            }
            MessageBox.Show("Poem size  " + valid_byte_count);
            bool success = false;

            byte[] data = new byte[1];
            int value = 0;
            data[0] = (byte)'P';
            serialPort1.Write(data, 0, 1);
            System.Threading.Thread.Sleep(20);
            if ((char)serialPort1.ReadByte() == 'T')
            {

                MessageBox.Show(""+((valid_byte_count >>8)&0xff));
                data[0] = (byte)((valid_byte_count >> 8)&0xff);
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(20);
                serialPort1.ReadByte();

                                MessageBox.Show(""+((valid_byte_count)&0xff));

                data[0] = (byte)(valid_byte_count & 0xff);
                serialPort1.Write(data, 0, 1);
                System.Threading.Thread.Sleep(20);
                serialPort1.ReadByte();

                
                 for (int k = 0; k < all_data.Length; k++)
            {
                if (all_data[k] == '\n' || all_data[k] == '\t' || all_data[k] == '\r') ;
                else
                {

                    data[0] = all_data[k];
                    serialPort1.Write(data, 0, 1);
                    System.Threading.Thread.Sleep(8);
                    serialPort1.ReadByte();
                }
            }



                serialPort1.ReadByte();

            }

            MessageBox.Show("Poem has been loaded...");


        }

    }
}