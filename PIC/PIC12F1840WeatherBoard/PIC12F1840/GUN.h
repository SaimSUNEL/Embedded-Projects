#define PAZARTESI 1
#define SALI 2
#define CARSAMBA 3
#define PERSEMBE 4
#define CUMA 5
#define CUMARTESI 6
#define PAZAR 0

#define BUGUN 0
#define YARIN 1
#define GUN2 2
#define GUN3 3
#define GUN4 4
#define GUN5 5

#define GUNREGISTER 3
#define HAVAGUNREGISTER 2

byte gunData, gosterilenGun;

void LoadGunInfo(byte gun)
{
gunData = 1 << gun;
TempLoadDigit(GUNREGISTER, gunData);

}
//For which day the weather information is displayed..
void LoadGosterilenGunInfo(byte g)
{
gosterilenGun = 1 << g;
TempLoadDigit(HAVAGUNREGISTER, gosterilenGun);


}