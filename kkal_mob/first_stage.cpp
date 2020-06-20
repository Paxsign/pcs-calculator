#include "first_stage.h"
#include "defs.h"
#include "qdebug.h"


void first_stage::buttonClicked(QString age_input,QString height_input,QString weight_input,bool is_male,bool is_female)
{
    int age = age_input.toInt();
    int height = height_input.toInt();
    int weight = weight_input.toInt();
    male = is_male;
    female = is_female;
    if (female)
    {
       voo = 9.99*(weight)+6.25*(height)-4.92*(age)-161;
    }
    if (male)
    {
       voo = 9.99*(weight)+6.25*(height)-4.92*(age)+5;
    }
emit send_voo(voo);




}
