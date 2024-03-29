// qtreewidget.sip generated by MetaSIP on Fri Oct 29 15:43:58 2010
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
#include <qtreewidget.h>
%End

class QTreeWidgetItem /Supertype=sip.wrapper/
{
%TypeHeaderCode
#include <qtreewidget.h>
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
%If (Qt_4_5_0 -)
    explicit QTreeWidgetItem(int type = Type);
%End
%If (- Qt_4_5_0)
    QTreeWidgetItem(int type = Type);
%End
    QTreeWidgetItem(const QStringList &, int type = Type);
    QTreeWidgetItem(QTreeWidget * /TransferThis/, int type = Type);
    QTreeWidgetItem(QTreeWidget * /TransferThis/, const QStringList &, int type = Type);
    QTreeWidgetItem(QTreeWidget * /TransferThis/, QTreeWidgetItem *, int type = Type);
    QTreeWidgetItem(QTreeWidgetItem * /TransferThis/, int type = Type);
    QTreeWidgetItem(QTreeWidgetItem * /TransferThis/, const QStringList &, int type = Type);
    QTreeWidgetItem(QTreeWidgetItem * /TransferThis/, QTreeWidgetItem *, int type = Type);
    QTreeWidgetItem(const QTreeWidgetItem &);
    virtual ~QTreeWidgetItem();
    virtual QTreeWidgetItem *clone() const /Factory/;
    QTreeWidget *treeWidget() const;
    Qt::ItemFlags flags() const;
    QString text(int) const;
    QIcon icon(int) const;
    QString statusTip(int) const;
%If (PyQt_ToolTip)
    QString toolTip(int) const;
%End
%If (PyQt_WhatsThis)
    QString whatsThis(int) const;
%End
    QFont font(int) const;
    int textAlignment(int) const;
    void setTextAlignment(int, int);
    QColor backgroundColor(int) const;
    void setBackgroundColor(int, const QColor &);
    QColor textColor(int) const;
    void setTextColor(int, const QColor &);
    Qt::CheckState checkState(int) const;
    void setCheckState(int, Qt::CheckState);
    virtual QVariant data(int, int) const;
    virtual void setData(int, int, const QVariant &);
    virtual bool operator<(const QTreeWidgetItem & /NoCopy/) const;
    virtual void read(QDataStream &) /ReleaseGIL/;
    virtual void write(QDataStream &) const /ReleaseGIL/;
    QTreeWidgetItem *parent() const;
    QTreeWidgetItem *child(int) const;
    int childCount() const;
    int columnCount() const;
    void addChild(QTreeWidgetItem * /Transfer/);
    void insertChild(int, QTreeWidgetItem * /Transfer/);
    QTreeWidgetItem *takeChild(int) /TransferBack/;
    int type() const;
    void setFlags(Qt::ItemFlags);
    void setText(int, const QString &);
    void setIcon(int, const QIcon &);
    void setStatusTip(int, const QString &);
%If (PyQt_ToolTip)
    void setToolTip(int, const QString &);
%End
%If (PyQt_WhatsThis)
    void setWhatsThis(int, const QString &);
%End
    void setFont(int, const QFont &);
    int indexOfChild(QTreeWidgetItem *) const;
    QSize sizeHint(int) const;
    void setSizeHint(int, const QSize &);
    void addChildren(const QList<QTreeWidgetItem*> & /Transfer/);
    void insertChildren(int, const QList<QTreeWidgetItem*> & /Transfer/);
    QList<QTreeWidgetItem*> takeChildren() /TransferBack/;
%If (Qt_4_2_0 -)
    QBrush background(int) const;
%End
%If (Qt_4_2_0 -)
    void setBackground(int, const QBrush &);
%End
%If (Qt_4_2_0 -)
    QBrush foreground(int) const;
%End
%If (Qt_4_2_0 -)
    void setForeground(int, const QBrush &);
%End
%If (Qt_4_2_0 -)
    void sortChildren(int, Qt::SortOrder);
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
%If (Qt_4_2_0 -)
    void setExpanded(bool);
%End
%If (Qt_4_2_0 -)
    bool isExpanded() const;
%End
%If (Qt_4_3_0 -)

    enum ChildIndicatorPolicy
    {
        ShowIndicator,
        DontShowIndicator,
        DontShowIndicatorWhenChildless,
    };

%End
%If (Qt_4_3_0 -)
    void setChildIndicatorPolicy(QTreeWidgetItem::ChildIndicatorPolicy);
%End
%If (Qt_4_3_0 -)
    QTreeWidgetItem::ChildIndicatorPolicy childIndicatorPolicy() const;
%End
%If (Qt_4_3_0 -)
    void removeChild(QTreeWidgetItem * /TransferBack/);
%End
%If (Qt_4_3_0 -)
    void setFirstColumnSpanned(bool);
%End
%If (Qt_4_3_0 -)
    bool isFirstColumnSpanned() const;
%End
%If (Qt_4_3_0 -)
    void setDisabled(bool);
%End
%If (Qt_4_3_0 -)
    bool isDisabled() const;
%End

protected:
%If (Qt_4_5_0 -)
    void emitDataChanged();
%End

private:
    QTreeWidgetItem &operator=(const QTreeWidgetItem &);
};

QDataStream &operator<<(QDataStream &, const QTreeWidgetItem & /Constrained/);
QDataStream &operator>>(QDataStream &, QTreeWidgetItem & /Constrained/);

class QTreeWidget : QTreeView
{
%TypeHeaderCode
#include <qtreewidget.h>
%End

public:
    explicit QTreeWidget(QWidget *parent /TransferThis/ = 0);
    virtual ~QTreeWidget();
    int columnCount() const;
    void setColumnCount(int);
    QTreeWidgetItem *topLevelItem(int) const;
    int topLevelItemCount() const;
    void insertTopLevelItem(int, QTreeWidgetItem * /Transfer/);
    void addTopLevelItem(QTreeWidgetItem * /Transfer/);
    QTreeWidgetItem *takeTopLevelItem(int) /TransferBack/;
    int indexOfTopLevelItem(QTreeWidgetItem *);
    void insertTopLevelItems(int, const QList<QTreeWidgetItem*> & /Transfer/);
    void addTopLevelItems(const QList<QTreeWidgetItem*> & /Transfer/);
    QTreeWidgetItem *headerItem() const;
    void setHeaderItem(QTreeWidgetItem * /Transfer/);
    void setHeaderLabels(const QStringList &);
    QTreeWidgetItem *currentItem() const;
    int currentColumn() const;
    void setCurrentItem(QTreeWidgetItem *);
    void setCurrentItem(QTreeWidgetItem *, int);
%If (Qt_4_4_0 -)
    void setCurrentItem(QTreeWidgetItem *, int, QFlags<QItemSelectionModel::SelectionFlag>);
%End
    QTreeWidgetItem *itemAt(const QPoint &) const;
    QTreeWidgetItem *itemAt(int, int) const;
    QRect visualItemRect(const QTreeWidgetItem *) const;
    int sortColumn() const;
    void sortItems(int, Qt::SortOrder);
    void setSortingEnabled(bool);
    bool isSortingEnabled() const;
    void editItem(QTreeWidgetItem *, int column = 0);
    void openPersistentEditor(QTreeWidgetItem *, int column = 0);
    void closePersistentEditor(QTreeWidgetItem *, int column = 0);
    QWidget *itemWidget(QTreeWidgetItem *, int) const;
    void setItemWidget(QTreeWidgetItem *, int, QWidget * /Transfer/);
    bool isItemSelected(const QTreeWidgetItem *) const;
    void setItemSelected(const QTreeWidgetItem *, bool);
    QList<QTreeWidgetItem*> selectedItems() const;
    QList<QTreeWidgetItem*> findItems(const QString &, Qt::MatchFlags, int column = 0) const;
    bool isItemHidden(const QTreeWidgetItem *) const;
    void setItemHidden(const QTreeWidgetItem *, bool);
    bool isItemExpanded(const QTreeWidgetItem *) const;
    void setItemExpanded(const QTreeWidgetItem *, bool);

public slots:
    void scrollToItem(const QTreeWidgetItem *, QAbstractItemView::ScrollHint hint = QAbstractItemView::EnsureVisible);
    void expandItem(const QTreeWidgetItem *);
    void collapseItem(const QTreeWidgetItem *);
    void clear();

signals:
    void itemPressed(QTreeWidgetItem *, int);
    void itemClicked(QTreeWidgetItem *, int);
    void itemDoubleClicked(QTreeWidgetItem *, int);
    void itemActivated(QTreeWidgetItem *, int);
    void itemEntered(QTreeWidgetItem *, int);
    void itemChanged(QTreeWidgetItem *, int);
    void itemExpanded(QTreeWidgetItem *);
    void itemCollapsed(QTreeWidgetItem *);
    void currentItemChanged(QTreeWidgetItem *, QTreeWidgetItem *);
    void itemSelectionChanged();

protected:
    virtual QStringList mimeTypes() const;
    virtual QMimeData *mimeData(const QList<QTreeWidgetItem*>) const /TransferBack/;
    virtual bool dropMimeData(QTreeWidgetItem *, int, const QMimeData *, Qt::DropAction);
    virtual Qt::DropActions supportedDropActions() const;
    QList<QTreeWidgetItem*> items(const QMimeData *) const;
    QModelIndex indexFromItem(QTreeWidgetItem *, int column = 0) const;
    QTreeWidgetItem *itemFromIndex(const QModelIndex &) const;
    virtual bool event(QEvent *);
%If (Qt_4_2_0 -)
    virtual void dropEvent(QDropEvent *);
%End

public:
%If (Qt_4_2_0 -)
    QTreeWidgetItem *invisibleRootItem() const;
%End
%If (Qt_4_2_0 -)
    void setHeaderLabel(const QString &);
%End
%If (Qt_4_3_0 -)
    bool isFirstItemColumnSpanned(const QTreeWidgetItem *) const;
%End
%If (Qt_4_3_0 -)
    void setFirstItemColumnSpanned(const QTreeWidgetItem *, bool);
%End
%If (Qt_4_3_0 -)
    QTreeWidgetItem *itemAbove(const QTreeWidgetItem *) const;
%End
%If (Qt_4_3_0 -)
    QTreeWidgetItem *itemBelow(const QTreeWidgetItem *) const;
%End
%If (Qt_4_3_0 -)
    void removeItemWidget(QTreeWidgetItem * /TransferBack/, int);
%End
%If (Qt_4_5_0 -)
    virtual void setSelectionModel(QItemSelectionModel * /KeepReference/);
%End

private:
    virtual void setModel(QAbstractItemModel * /KeepReference/);
    QTreeWidget(const QTreeWidget &);
};
