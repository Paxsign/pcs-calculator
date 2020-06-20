#include "second_stage.h"
#include "defs.h"
#include <QtDebug>



void second_stage::get_rate_time_activ(double rate, double hours, double minute){

    double count_hours=0;
    double count_minute=0;
    qDebug()<<rate;
    qDebug()<<voo;
    double time = (hours+minute/60);

    double burn_ckal = (voo/24)*rate*time;
    kcal_burn_time.append(burn_ckal);
    qDebug()<<time;

    //count_hours=count_hours + hours;
    //count_minute=count_minute + minute;

    kcal_burn_time.append(hours);
    kcal_burn_time.append(minute);

    kcal_burn_time_list.append(kcal_burn_time);

    total_burn_kcal += burn_ckal;

    for(int i=0;i<kcal_burn_time_list.count();i++){
        count_hours=count_hours + kcal_burn_time_list[i][1];
        count_minute=count_minute + kcal_burn_time_list[i][2];

    }

    if (count_minute>59){
        count_hours=count_hours + 1;
        count_minute=count_minute - 60;
    }
    kcal_burn_time.clear();
    emit send_kcal_burn_full_time(total_burn_kcal,count_hours,count_minute);

    //qDebug()<<count_hours;

}
void second_stage::get_rate_time_activ(int index_delete){
    double count_hours=0;
    double count_minute=0;
    total_burn_kcal = 0;
    qDebug()<<kcal_burn_time_list;
    kcal_burn_time_list.removeAt(index_delete);
    for(int i=0;i<kcal_burn_time_list.count();i++){
        count_hours=count_hours + kcal_burn_time_list[i][1];
        count_minute=count_minute + kcal_burn_time_list[i][2];
    }
    if (count_minute>59){
        count_hours=count_hours + 1;
        count_minute=count_minute - 60;
    }
    for(int i=0;i<kcal_burn_time_list.count();i++){
        total_burn_kcal=total_burn_kcal + kcal_burn_time_list[i][0];
    }
    qDebug()<<kcal_burn_time_list;
    emit send_kcal_burn_full_time(total_burn_kcal,count_hours,count_minute);
}
