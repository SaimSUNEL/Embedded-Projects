
#define HAVAREG1 8 // HAva register 1 in Center Register pin 8
#define HAVAREG2 9 // HAva register 1 in Center Register pin 9
#define HAVAREG3 10 // HAva register 1 in Center Register pin 10

byte havaRegister1, havaRegister2, havaRegister3;
void SetHavaDurumuPin(byte pin_number, byte pin_value)
{
	if(pin_number < 8)
	{
		if(pin_value)
		{
			havaRegister1 = 1 << pin_number;
		}
		else havaRegister1 &= ~(1 << pin_number);
		TempLoadDigit(HAVAREG1, havaRegister1);
	}
	else if(pin_number >= 8 && pin_number <16)
	{
		if(pin_value)
		{
				havaRegister2 = 1 << (pin_number - 8);

		}
		else 
			havaRegister2 &= ~(1 << (pin_number - 8));

		TempLoadDigit(HAVAREG2, havaRegister2);

	}
	else if(pin_number >= 16)
	{
		if(pin_value)
		havaRegister3 = 1 << (pin_number - 16);
		else 	havaRegister3 &= ~(1 << (pin_number - 16));

		TempLoadDigit(HAVAREG3, havaRegister3);

	}


}









/*
    switch (hadiseKodu) {
        case "A": return "A��k";
        case "AB": return "Az Bulutlu";
        case "PB": return "Par�al� Bulutlu";
        case "CB": return "�ok Bulutlu";
        case "HY": return "Hafif Ya�murlu";
        case "Y": return "Ya�murlu";
        case "KY": return "Kuvvetli Ya�murlu";
        case "KKY": return "Karla Kar���k Ya�murlu";
        case "HKY": return "Hafif Kar Ya���l�";
        case "K": return "Kar Ya���l�";
        case "KYK": return "Yo�un Kar Ya���l�";
        case "HSY": return "Hafif Sa�anak Ya���l�";
        case "SY": return "Sa�anak Ya���l�";
        case "KSY": return "Kuvvetli Sa�anak Ya���l�";
        case "MSY": return "Mevzi Sa�anak Ya���l�";
        case "DY": return "Dolu";
        case "GSY": return "G�kg�r�lt�l� Sa�anak Ya���l�";
        case "KGSY": return "Kuvvetli G�kg�r�lt�l� Sa�anak Ya���l�";
        case "SIS": return "Sisli";
        case "PUS": return "Puslu";
        case "DNM": return "Dumanl�";
        case "KF": return "Toz veya Kum F�rt�nas�";
        case "R": return "R�zgarl�";
        case "GKR": return "G�neyli Kuvvetli R�zgar";
        case "KKR": return "Kuzeyli Kuvvetli R�zgar";
        case "SCK": return "S�cak";
        case "SGK": return "So�uk";
        case "HHY": return "Ya���l�";
        default: return "";

    }
*/