#ifndef FIRST_STAGE_H
#define FIRST_STAGE_H

#include <QObject>
#include <QVariant>

class first_stage : public QObject
{
    Q_OBJECT
public:
    first_stage(QObject *QMLObject) : viewer(QMLObject){}

signals:
    void send_voo(double s_voo);
public slots:
    void buttonClicked(QString age_input,QString height_input,QString weight_input,bool is_male,bool is_female);//слот для приема данных из qml
protected:
    QObject *viewer;
};

#endif // FIRST_STAGE_H
