#include "tablemodel.h"

TableModel::TableModel()
{

}

int TableModel::rowCount(const QModelIndex &index) const
{
    return 10;
}

int TableModel::columnCount(const QModelIndex &index) const
{
    return 10;
}

QVariant TableModel::data(const QModelIndex &index, int role) const
{
    if (role == Qt::DisplayRole) {
        return QString("%1 %2").arg(index.column()).arg(index.row());
    } else {
        return QVariant();
    }
}
