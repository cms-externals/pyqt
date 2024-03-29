// qframe.sip generated by MetaSIP on Fri Oct 29 15:43:58 2010
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


class QFrame : QWidget
{
%TypeHeaderCode
#include <qframe.h>
%End

public:
    enum Shadow
    {
        Plain,
        Raised,
        Sunken,
    };

    enum Shape
    {
        NoFrame,
        Box,
        Panel,
        WinPanel,
        HLine,
        VLine,
        StyledPanel,
    };

%If (Qt_4_2_0 -)

    enum StyleMask
    {
        Shadow_Mask,
        Shape_Mask,
    };

%End
%If (Qt_4_2_0 -)
    QFrame(QWidget *parent /TransferThis/ = 0, Qt::WindowFlags flags = 0);
%End
%If (- Qt_4_2_0)
    QFrame(QWidget *parent /TransferThis/ = 0, Qt::WFlags flags = 0);
%End
    virtual ~QFrame();
    int frameStyle() const;
    void setFrameStyle(int);
    int frameWidth() const;
    virtual QSize sizeHint() const;
    QFrame::Shape frameShape() const;
    void setFrameShape(QFrame::Shape);
    QFrame::Shadow frameShadow() const;
    void setFrameShadow(QFrame::Shadow);
    int lineWidth() const;
    void setLineWidth(int);
    int midLineWidth() const;
    void setMidLineWidth(int);
    QRect frameRect() const;
    void setFrameRect(const QRect &);

protected:
    virtual bool event(QEvent *);
    virtual void paintEvent(QPaintEvent *);
    virtual void changeEvent(QEvent *);
    void drawFrame(QPainter *);

private:
    QFrame(const QFrame &);
};
