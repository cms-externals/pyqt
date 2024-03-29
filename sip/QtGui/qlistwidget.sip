// qlistwidget.sip generated by MetaSIP on Fri Oct 29 15:43:58 2010
//
// This file is part of the QtGui Python extension module.
//
// Copyright (c) 2010 Riverbank Computing Limited <info@riverbankcomputing.com>
// 
// This file is part of PyQt.
// 
// This file may be used under the terms of the GNU General Public
// License versions 2.0 or 3.0 as published by the Free Software
// Foundation and appearing in the files LICENSE.GPL2 and LICENSE.GPL3
// included in the packaging of this file.  Alternatively you may (at
// your option) use any later version of the GNU General Public
// License if such license has been publicly approved by Riverbank
// Computing Limited (or its successors, if any) and the KDE Free Qt
// Foundation. In addition, as a special exception, Riverbank gives you
// certain additional rights. These rights are described in the Riverbank
// GPL Exception version 1.1, which can be found in the file
// GPL_EXCEPTION.txt in this package.
// 
// Please review the following information to ensure GNU General
// Public Licensing requirements will be met:
// http://trolltech.com/products/qt/licenses/licensing/opensource/. If
// you are unsure which license is appropriate for your use, please
// review the following information:
// http://trolltech.com/products/qt/licenses/licensing/licensingoverview
// or contact the sales department at sales@riverbankcomputing.com.
// 
// This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
// WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.


%ModuleCode
#include <qlistwidget.h>
%End

class QListWidgetItem /Supertype=sip.wrapper/
{
%TypeHeaderCode
#include <qlistwidget.h>
%End

public:
%If (Qt_4_2_0 -)

    enum ItemType
    {
        Type,
        UserType,
    };

%End
%If (- Qt_4_2_0)

    enum
    {
        Type,
        UserType,
    };

%End
    QListWidgetItem(QListWidget *parent /TransferThis/ = 0, int type = Type);
    QListWidgetItem(const QString &, QListWidget *parent /TransferThis/ = 0, int type = Type);
    QListWidgetItem(const QIcon &, const QString &, QListWidget *parent /TransferThis/ = 0, int type = Type);
    QListWidgetItem(const QListWidgetItem &);
    virtual ~QListWidgetItem();
    virtual QListWidgetItem *clone() const /Factory/;
    QListWidget *listWidget() const;
    Qt::ItemFlags flags() const;
    QString text() const;
    QIcon icon() const;
    QString statusTip() const;
%If (PyQt_ToolTip)
    QString toolTip() const;
%End
%If (PyQt_WhatsThis)
    QString whatsThis() const;
%End
    QFont font() const;
    int textAlignment() const;
    void setTextAlignment(int);
    QColor backgroundColor() const;
    virtual void setBackgroundColor(const QColor &);
    QColor textColor() const;
    void setTextColor(const QColor &);
    Qt::CheckState checkState() const;
    void setCheckState(Qt::CheckState);
    QSize sizeHint() const;
    void setSizeHint(const QSize &);
    virtual QVariant data(int) const;
    virtual void setData(int, const QVariant &);
    virtual bool operator<(const QListWidgetItem & /NoCopy/) const;
    virtual void read(QDataStream &) /ReleaseGIL/;
    virtual void write(QDataStream &) const /ReleaseGIL/;
    int type() const;
    void setFlags(Qt::ItemFlags);
    void setText(const QString &);
    void setIcon(const QIcon &);
    void setStatusTip(const QString &);
%If (PyQt_ToolTip)
    void setToolTip(const QString &);
%End
%If (PyQt_WhatsThis)
    void setWhatsThis(const QString &);
%End
    void setFont(const QFont &);
%If (Qt_4_2_0 -)
    QBrush background() const;
%End
%If (Qt_4_2_0 -)
    void setBackground(const QBrush &);
%End
%If (Qt_4_2_0 -)
    QBrush foreground() const;
%End
%If (Qt_4_2_0 -)
    void setForeground(const QBrush &);
%End
%If (Qt_4_2_0 -)
    void setSelected(bool);
%End
%If (Qt_4_2_0 -)
    bool isSelected() const;
%End
%If (Qt_4_2_0 -)
    void setHidden(bool);
%End
%If (Qt_4_2_0 -)
    bool isHidden() const;
%End

private:
    QListWidgetItem &operator=(const QListWidgetItem &);
};

QDataStream &operator<<(QDataStream &, const QListWidgetItem & /Constrained/);
QDataStream &operator>>(QDataStream &, QListWidgetItem & /Constrained/);

class QListWidget : QListView
{
%TypeHeaderCode
#include <qlistwidget.h>
%End

public:
    explicit QListWidget(QWidget *parent /TransferThis/ = 0);
    virtual ~QListWidget();
    QListWidgetItem *item(int) const;
    int row(const QListWidgetItem *) const;
    void insertItem(int, QListWidgetItem * /Transfer/);
    void insertItem(int, const QString &);
    void insertItems(int, const QStringList &);
    void addItem(QListWidgetItem * /Transfer/);
    void addItem(const QString &);
    void addItems(const QStringList &);
    QListWidgetItem *takeItem(int) /TransferBack/;
    int count() const /__len__/;
    QListWidgetItem *currentItem() const;
    void setCurrentItem(QListWidgetItem *);
%If (Qt_4_4_0 -)
    void setCurrentItem(QListWidgetItem *, QFlags<QItemSelectionModel::SelectionFlag>);
%End
    int currentRow() const;
    void setCurrentRow(int);
%If (Qt_4_4_0 -)
    void setCurrentRow(int, QFlags<QItemSelectionModel::SelectionFlag>);
%End
    QListWidgetItem *itemAt(const QPoint &) const;
    QListWidgetItem *itemAt(int, int) const;
    QWidget *itemWidget(QListWidgetItem *) const;
    void setItemWidget(QListWidgetItem *, QWidget * /Transfer/);
%MethodCode
        // We have to break the association with any existing widget.
        QWidget *w = sipCpp->itemWidget(a0);
        
        if (w)
        {
            PyObject *wo = sipGetPyObject(w, sipType_QWidget);
        
            if (wo)
                sipTransferBreak(wo);
        }
        
        Py_BEGIN_ALLOW_THREADS
        sipCpp->setItemWidget(a0, a1);
        Py_END_ALLOW_THREADS
%End

    QRect visualItemRect(const QListWidgetItem *) const;
    void sortItems(Qt::SortOrder order = Qt::AscendingOrder);
    void editItem(QListWidgetItem *);
    void openPersistentEditor(QListWidgetItem *);
    void closePersistentEditor(QListWidgetItem *);
    bool isItemSelected(const QListWidgetItem *) const;
    void setItemSelected(const QListWidgetItem *, bool);
    QList<QListWidgetItem*> selectedItems() const;
    QList<QListWidgetItem*> findItems(const QString &, Qt::MatchFlags) const;
    bool isItemHidden(const QListWidgetItem *) const;
    void setItemHidden(const QListWidgetItem *, bool);

public slots:
    void clear();
    void scrollToItem(const QListWidgetItem *, QAbstractItemView::ScrollHint hint = QAbstractItemView::EnsureVisible);

signals:
    void itemPressed(QListWidgetItem *);
    void itemClicked(QListWidgetItem *);
    void itemDoubleClicked(QListWidgetItem *);
    void itemActivated(QListWidgetItem *);
    void itemEntered(QListWidgetItem *);
    void itemChanged(QListWidgetItem *);
    void currentItemChanged(QListWidgetItem *, QListWidgetItem *);
    void currentTextChanged(const QString &);
    void currentRowChanged(int);
    void itemSelectionChanged();

protected:
    virtual QStringList mimeTypes() const;
    virtual QMimeData *mimeData(const QList<QListWidgetItem*>) const /TransferBack/;
    virtual bool dropMimeData(int, const QMimeData *, Qt::DropAction);
    virtual Qt::DropActions supportedDropActions() const;
    QList<QListWidgetItem*> items(const QMimeData *) const;
    QModelIndex indexFromItem(QListWidgetItem *) const;
    QListWidgetItem *itemFromIndex(const QModelIndex &) const;
    virtual bool event(QEvent *);

public:
%If (Qt_4_2_0 -)
    void setSortingEnabled(bool);
%End
%If (Qt_4_2_0 -)
    bool isSortingEnabled() const;
%End
%If (Qt_4_2_0 -)
    virtual void dropEvent(QDropEvent *);
%End
%If (Qt_4_3_0 -)
    void removeItemWidget(QListWidgetItem *);
%MethodCode
        // We have to break the association with any existing widget.
        QWidget *w = sipCpp->itemWidget(a0);
        
        if (w)
        {
            PyObject *wo = sipGetPyObject(w, sipType_QWidget);
        
            if (wo)
                sipTransferBreak(wo);
        }
        
        Py_BEGIN_ALLOW_THREADS
        sipCpp->removeItemWidget(a0);
        Py_END_ALLOW_THREADS
%End

%End

private:
    virtual void setModel(QAbstractItemModel * /KeepReference/);
    QListWidget(const QListWidget &);
};
