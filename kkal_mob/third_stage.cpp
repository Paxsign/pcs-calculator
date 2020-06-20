
#include <QtDebug>
#include "third_stage.h"
#include "defs.h"
#include "QList"

#include "third_stage_product_model.h"


void third_stage::get_product(QString weight, int index, int eat_type){
    double d_weight = weight.toDouble();
    total_kcal=0;
        //qDebug()<<index;
        food_eaten_list.append(eat_type);
        food_eaten_list.append(list_product_data[index].animal_proteins*d_weight);
        food_eaten_list.append(list_product_data[index].vegetable_proteins*d_weight);
        food_eaten_list.append(list_product_data[index].animal_lipid*d_weight);
        food_eaten_list.append(list_product_data[index].vegetable_lipid*d_weight);
        food_eaten_list.append(list_product_data[index].carb*d_weight);
        food_eaten_list.append(list_product_data[index].Ca*d_weight);
        food_eaten_list.append(list_product_data[index].P*d_weight);
        food_eaten_list.append(list_product_data[index].kcal*d_weight);
        food_eaten_list.append(list_product_data[index].vit_C*d_weight);
        food_eaten_list.append(list_product_data[index].unknown_1*d_weight);
        food_eaten_list.append(list_product_data[index].unknown_2*d_weight);

        food_kcal_list.append(food_eaten_list);

        for (int i =0; i<food_kcal_list.count(); i++){
            total_kcal=total_kcal + food_kcal_list[i][8];

        }

    food_eaten_list.clear();
    emit send_product(total_kcal);
}

void third_stage::get_product(int index, int eat_type){
    int counter = 0;
    total_kcal=0;
    qDebug()<<index;
        for (int i =0; i<food_kcal_list.count(); i++){
           // qDebug()<<food_kcal_list[i];
            if (food_kcal_list[i][0] == eat_type) {
                    if (counter == index) food_kcal_list.removeAt(i);
                    counter++;}

        }
        for (int i =0; i<food_kcal_list.count(); i++){
           // qDebug()<<food_kcal_list[i];
            total_kcal=total_kcal + food_kcal_list[i][8];
            //qDebug()<<food_kcal_list[i][9];
        }



    emit send_product(total_kcal);
}
