#ifndef SECOND_STAGE_ACTIVITY_MODEL_H
#define SECOND_STAGE_ACTIVITY_MODEL_H

#include <QAbstractListModel>


class Second_stage_activity_model : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit Second_stage_activity_model(QObject *parent = nullptr);

    enum {
        Key,
        Value
    };

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Editable:
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;

    virtual QHash<int,QByteArray> roleNames() const override;
private:
    QStringList m_active;





};

#endif // SECOND_STAGE_ACTIVITY_MODEL_H
