#ifndef SECOND_STAGE_H
#define SECOND_STAGE_H

#include <QObject>
#include <QVariant>

class second_stage : public QObject
{
    Q_OBJECT
public:
    second_stage(QObject *QMLObject) : viewer(QMLObject){}

signals:
    void send_kcal_burn_full_time(double kcal_burn, double hours, double minute);

public slots:
    void get_rate_time_activ(double rate,double hours, double minute);//слот для приема данных из qml
    void get_rate_time_activ(int index_delete);
protected:
    QObject viewer;

private:


    QList <double> kcal_burn_time;
    QList <QList<double>> kcal_burn_time_list;
};

#endif // SECOND_STAGE_H
