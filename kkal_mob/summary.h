#ifndef SUMMARY_H
#define SUMMARY_H

#include <QObject>
#include <QVector>

class summary : public QObject
{
    Q_OBJECT
public:
     summary(QObject *QMLObject) : viewer(QMLObject){}

signals:
    void send_summary(QVector<double> summary_list, double total_burn_kcal);
protected:
    QObject *viewer;
public slots:
    void get_summary(int index);
    void clear_var();

private:  QVector<double> total_food;

};

#endif // SUMMARY_H
