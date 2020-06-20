#ifndef THIRD_STAGE_PRODUCT_MODEL_H
#define THIRD_STAGE_PRODUCT_MODEL_H

#include <QAbstractTableModel>


struct product_data{
 QString name;
 double animal_proteins;
 double vegetable_proteins;
 double animal_lipid;
 double vegetable_lipid;
 double carb; //углевод
 double Ca;
 double P;
 double kcal;
 double vit_C;
 double unknown_1;
 double unknown_2;
};

class third_stage_product_model : public QAbstractTableModel
{
    Q_OBJECT

public:
    explicit third_stage_product_model(QObject *parent = nullptr);

    enum {
        name,
        animal_proteins,
        vegetable_proteins,
        animal_lipid,
        vegetable_lipid,
        carb,
        Ca,
        P,
        kcal,
        vit_C,
        unknown_1,
        unknown_2,
    };

    // Header:
    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    int columnCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Add data:
    bool insertRows(int row, int count, const QModelIndex &parent = QModelIndex()) override;
    bool insertColumns(int column, int count, const QModelIndex &parent = QModelIndex()) override;
    virtual QHash<int,QByteArray> roleNames() const override;

    private:
    //QList<product_data> list_product_data;
    
};

#endif // THIRD_STAGE_PRODUCT_MODEL_H
