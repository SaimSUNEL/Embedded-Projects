
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
        case "A": return "Açýk";
        case "AB": return "Az Bulutlu";
        case "PB": return "Parçalý Bulutlu";
        case "CB": return "Çok Bulutlu";
        case "HY": return "Hafif Yaðmurlu";
        case "Y": return "Yaðmurlu";
        case "KY": return "Kuvvetli Yaðmurlu";
        case "KKY": return "Karla Karýþýk Yaðmurlu";
        case "HKY": return "Hafif Kar Yaðýþlý";
        case "K": return "Kar Yaðýþlý";
        case "KYK": return "Yoðun Kar Yaðýþlý";
        case "HSY": return "Hafif Saðanak Yaðýþlý";
        case "SY": return "Saðanak Yaðýþlý";
        case "KSY": return "Kuvvetli Saðanak Yaðýþlý";
        case "MSY": return "Mevzi Saðanak Yaðýþlý";
        case "DY": return "Dolu";
        case "GSY": return "Gökgürültülü Saðanak Yaðýþlý";
        case "KGSY": return "Kuvvetli Gökgürültülü Saðanak Yaðýþlý";
        case "SIS": return "Sisli";
        case "PUS": return "Puslu";
        case "DNM": return "Dumanlý";
        case "KF": return "Toz veya Kum Fýrtýnasý";
        case "R": return "Rüzgarlý";
        case "GKR": return "Güneyli Kuvvetli Rüzgar";
        case "KKR": return "Kuzeyli Kuvvetli Rüzgar";
        case "SCK": return "Sýcak";
        case "SGK": return "Soðuk";
        case "HHY": return "Yaðýþlý";
        default: return "";

    }
*/