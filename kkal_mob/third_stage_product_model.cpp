#include "third_stage_product_model.h"
#include "QAbstractTableModel"
#include "QFile"
#include "QtDebug"
#include "defs.h"


third_stage_product_model::third_stage_product_model(QObject *parent)
    : QAbstractTableModel(parent)
{
    QFile file("tablitsa_produktov_itog.csv");//"assets:/tablitsa_produktov_itog.csv"
    if ( !file.open(QFile::ReadOnly | QFile::Text) ) {
        qDebug() << "File not exists";
    } else {
        // Создаём поток для извлечения данных из файла
        QTextStream in(&file);
        // Считываем данные до конца файла
        while (!in.atEnd())
        {
            in.setCodec("UTF-8");
            // ... построчно
            QString line = in.readLine();
            QStringList split_line = line.split(",");
            product_data prod;
            // Добавляем в модель по строке с элементами
            // учитываем, что строка разделяется точкой с запятой на колонки
           // for QString item : line.split(",")) {
            prod.name=split_line[0];
            prod.animal_proteins=split_line[1].toDouble();
            prod.vegetable_proteins=split_line[2].toDouble();
            prod.animal_lipid=split_line[3].toDouble();
            prod.vegetable_lipid=split_line[4].toDouble();
            prod.carb=split_line[5].toDouble();
            prod.Ca=split_line[6].toDouble();
            prod.P=split_line[7].toDouble();
            prod.kcal=split_line[8].toDouble();
            prod.vit_C=split_line[9].toDouble();
            prod.unknown_1=split_line[10].toDouble();
            prod.unknown_2=split_line[11].toDouble();

           // qDebug()<<prod.kcal;
            list_product_data.append(prod);


                //list_product_data.append(item);
             //   i++;
                //standardItemsList.append(new QStandardItem(item));
            //}
        }
        file.close();

}

}    

QVariant third_stage_product_model::headerData(int section, Qt::Orientation orientation, int role) const
{
    // FIXME: Implement me!
}

int third_stage_product_model::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;

    // FIXME: Implement me!
    return list_product_data.size();
}

int third_stage_product_model::columnCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;

    // FIXME: Implement me!
    return 12;
}

QVariant third_stage_product_model::data(const QModelIndex &index, int role) const
{

    if (!index.isValid())
        return QVariant();


    switch (role) {
        case name:{
            return list_product_data[index.row()].name;}
        case animal_proteins:{
            return list_product_data[index.row()].animal_proteins;}
    case vegetable_proteins:
        return list_product_data[index.row()].vegetable_proteins;
    case animal_lipid:
        return list_product_data[index.row()].animal_lipid;
    case vegetable_lipid:
        return list_product_data[index.row()].animal_lipid;
    case carb:
        return list_product_data[index.row()].carb;
    case Ca:
        return list_product_data[index.row()].Ca;
    case P:
        return list_product_data[index.row()].P;
    case kcal:{
        return list_product_data[index.row()].kcal;}
    case vit_C:
        return list_product_data[index.row()].vit_C;
    case unknown_1:
        return list_product_data[index.row()].unknown_1;
    case unknown_2:
        return list_product_data[index.row()].unknown_2;
    default:qDebug() << "Not supposed to happen";
            return QVariant();

    }

}

bool third_stage_product_model::insertRows(int row, int count, const QModelIndex &parent)
{
    beginInsertRows(parent, row, row + count - 1);
    // FIXME: Implement me!
    endInsertRows();
}

bool third_stage_product_model::insertColumns(int column, int count, const QModelIndex &parent)
{
    beginInsertColumns(parent, column, column + count - 1);
    // FIXME: Implement me!
    endInsertColumns();
}

QHash<int, QByteArray> third_stage_product_model::roleNames() const{
    QHash<int, QByteArray> roles;
    roles[name] = "name";
    roles[animal_proteins] = "animal_proteins";
    roles[vegetable_proteins] = "vegetable_proteins";
    roles[animal_lipid] = "animal_lipid";
    roles[vegetable_lipid] = "vegetable_lipid";
    roles[carb] = "carb";
    roles[Ca] = "Ca";
    roles[P] = "P";
    roles[kcal] = "kcal";
    roles[vit_C] = "vit_C";
    roles[unknown_1] = "unknown_1";
    roles[unknown_2] = "unknown_2";
    return roles;
}
