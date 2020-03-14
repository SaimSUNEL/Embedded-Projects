/* 
 * File:   TimeDiff.h
 * Author: Saim
 *
 * Created on 19 Ekim 2019 Cumartesi, 12:27
 */

#ifndef TIMEDIFF_H
#define	TIMEDIFF_H

#ifdef	__cplusplus
extern "C" {
#endif


struct tm Time1Start;    
struct tm Time1End;
double seconds;

//double year_diff, month_diff, day_diff, hour_diff, minute_diff, second_diff;
//unsigned int year_diff1, month_diff1, day_diff1, hour_diff1, minute_diff1, second_diff1;

unsigned long difference[6];
unsigned long divisions[] = {31104000, 2592000, 86400, 3600, 60, 1};
unsigned char diffs [6];

void getTimeDifference()
{
    
    /*
     19-20-10-12 14-55-20
      0  1  2  3  4  5  6 
     
     */
    
    Time1Start.tm_hour=12;
    Time1Start.tm_min=30;
    Time1Start.tm_sec=0;
    Time1Start.tm_year=118;
    Time1Start.tm_mon=5-1;
    Time1Start.tm_mday=2;
    
    
    Time1End.tm_hour= zaman[4];
    Time1End.tm_min=zaman[5];
    Time1End.tm_sec=zaman[6];
    Time1End.tm_year=100+zaman[0];
    Time1End.tm_mon=zaman[2]-1;
    Time1End.tm_mday=zaman[3];
    
seconds = difftime(mktime(&Time1End), mktime(&Time1Start));
for(char i=0; i < 6; i++)
{
    difference[i] = (long)(seconds/divisions[i]);
    diffs[i] = (unsigned char)difference[i];
    seconds -= difference[i]*divisions[i];
    if (i > 0)
    zaman[i+1] = diffs[i];
    else
    zaman[i] = diffs[i];
}
zaman[1] = 0;
}




#ifdef	__cplusplus
}
#endif

#endif	/* TIMEDIFF_H */

