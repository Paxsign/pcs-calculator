#include "second_stage_activity_model.h"
#include "QAbstractListModel"
#include "QFile"
#include "QtDebug"
#include "defs.h"

Second_stage_activity_model::Second_stage_activity_model(QObject *parent)
    : QAbstractListModel(parent)
{
    QFile file("tablitsa.csv");   //   assets:/tablitsa.csv
    if ( !file.open(QFile::ReadOnly | QFile::Text) ) {
        qDebug() << "File not exists";
    } else {
        qDebug() << "File exists";
        // Создаём поток для извлечения данных из файла
        QTextStream in(&file);
        // Считываем данные до конца файла
        while (!in.atEnd())
        {
            in.setCodec("UTF-8");
            // ... построчно
            QString line = in.readLine();
            m_active.append(line);
            //qDebug()<<m_active;
        }
    }
        file.close();

}

int Second_stage_activity_model::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid())
        return 0;

    // FIXME: Implement me!
    return m_active.size();
}

QVariant Second_stage_activity_model::data(const QModelIndex &index, int role) const
{qDebug()<<male;
    qDebug()<<female;
    if (!index.isValid())
        return QVariant();

    // FIXME: Implement me!
    switch (role) {
    case Key:
        //qDebug()<<"123";
        return m_active.at(index.row()).split(";")[0];
    case Value:
        if(male){
            qDebug()<<"123";
            return  m_active.at(index.row()).split(";")[1];
        }
        if(female){
            qDebug()<<"123";
            return  m_active.at(index.row()).split(";")[2];
        }
    }
    return QVariant();

}

bool Second_stage_activity_model::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (data(index, role) != value) {
        // FIXME: Implement me!
        emit dataChanged(index, index, QVector<int>() << role);
        return true;
    }
    return false;
}

Qt::ItemFlags Second_stage_activity_model::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable; // FIXME: Implement me!
}

QHash<int, QByteArray> Second_stage_activity_model::roleNames() const
{
    QHash<int, QByteArray> names;
    names[Key] = "key";
    names[Value] = "value";
    return names;


}


