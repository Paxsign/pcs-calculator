#include "summary.h"
#include <QtDebug>
#include "defs.h"
#include "QVector"

void summary::get_summary(int index){

     total_food.fill(0,11);

     if(index == 3){
         for(int i=0;i<food_kcal_list.count();i++){
                 for(int j=0;j<11;j++){
                     total_food[j]=total_food[j] + food_kcal_list[i][j+1];
             }
         }
     }
     else{
        for(int i=0;i<food_kcal_list.count();i++){
          // qDebug()<< food_kcal_list[i][0];
            if (food_kcal_list[i][0]==index) {
                for(int j=0;j<11;j++){
                   // qDebug()<<j;
                    total_food[j]=total_food[j] + food_kcal_list[i][j+1];
                }
            }
        }
     }
        qDebug()<<total_food;
        emit send_summary(total_food,total_burn_kcal);
        total_food.clear();
    }
void summary::clear_var(){
    voo = 0;
    total_kcal=0;
    total_burn_kcal=0;
    list_product_data.clear();
    food_kcal_list.clear();
}

