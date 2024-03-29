// qboxlayout.sip generated by MetaSIP on Fri Oct 29 15:43:58 2010
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


class QBoxLayout : QLayout
{
%TypeHeaderCode
#include <qboxlayout.h>
%End

public:
    enum Direction
    {
        LeftToRight,
        RightToLeft,
        TopToBottom,
        BottomToTop,
        Down,
        Up,
    };

    QBoxLayout(QBoxLayout::Direction, QWidget *parent /TransferThis/ = 0);
    virtual ~QBoxLayout();
    QBoxLayout::Direction direction() const;
    void setDirection(QBoxLayout::Direction);
    void addSpacing(int);
    void addStretch(int stretch = 0);
    void addWidget(QWidget * /Transfer/, int stretch = 0, Qt::Alignment alignment = 0);
    void addLayout(QLayout * /Transfer/, int stretch = 0);
    void addStrut(int);
    virtual void addItem(QLayoutItem * /Transfer/);
    void insertSpacing(int, int);
    void insertStretch(int, int stretch = 0);
    void insertWidget(int, QWidget * /Transfer/, int stretch = 0, Qt::Alignment alignment = 0);
    void insertLayout(int, QLayout * /Transfer/, int stretch = 0);
    bool setStretchFactor(QWidget *, int);
    bool setStretchFactor(QLayout *, int);
    virtual QSize sizeHint() const;
    virtual QSize minimumSize() const;
    virtual QSize maximumSize() const;
    virtual bool hasHeightForWidth() const;
    virtual int heightForWidth(int) const;
    virtual int minimumHeightForWidth(int) const;
    virtual Qt::Orientations expandingDirections() const;
    virtual void invalidate();
    virtual QLayoutItem *itemAt(int) const;
    virtual QLayoutItem *takeAt(int) /TransferBack/;
    virtual int count() const;
    virtual void setGeometry(const QRect &);
%If (Qt_4_3_0 -)
    int spacing() const;
%End
%If (Qt_4_3_0 -)
    void setSpacing(int);
%End
%If (Qt_4_4_0 -)
    void addSpacerItem(QSpacerItem * /Transfer/);
%End
%If (Qt_4_4_0 -)
    void insertSpacerItem(int, QSpacerItem * /Transfer/);
%End
%If (Qt_4_5_0 -)
    void setStretch(int, int);
%End
%If (Qt_4_5_0 -)
    int stretch(int) const;
%End

protected:
    void insertItem(int, QLayoutItem * /TransferThis/);

private:
    QBoxLayout(const QBoxLayout &);
};

class QHBoxLayout : QBoxLayout
{
%TypeHeaderCode
#include <qboxlayout.h>
%End

public:
    QHBoxLayout();
    explicit QHBoxLayout(QWidget * /TransferThis/);
    virtual ~QHBoxLayout();

private:
    QHBoxLayout(const QHBoxLayout &);
};

class QVBoxLayout : QBoxLayout
{
%TypeHeaderCode
#include <qboxlayout.h>
%End

public:
    QVBoxLayout();
    explicit QVBoxLayout(QWidget * /TransferThis/);
    virtual ~QVBoxLayout();

private:
    QVBoxLayout(const QVBoxLayout &);
};
