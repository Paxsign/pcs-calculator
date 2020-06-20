#ifndef THIRD_STAGE_H
#define THIRD_STAGE_H

//#define DEFS_H

#include <QObject>
#include <QQuickItem>
#include <third_stage_product_model.h>

class third_stage : public QObject
{
    Q_OBJECT
public:
    third_stage(QObject *QMLObject) : viewer(QMLObject){}

signals:
    void send_product(double kcal);
protected:
    QObject *viewer;

public slots:
    void get_product(QString weight, int index, int eat_type);
    void get_product(int index,int eat_type);
private:
    QList <double> food_eaten_list;
    //QList <QList<double>> food_kcal_list;

};



#endif // THIRD_STAGE_H
