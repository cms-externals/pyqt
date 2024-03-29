// qbrush.sip generated by MetaSIP on Fri Oct 29 15:43:58 2010
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
#include <qbrush.h>
%End

class QBrush
{
%TypeHeaderCode
#include <qbrush.h>
%End

%ConvertToTypeCode
// SIP doesn't support automatic type convertors so we explicitly allow a
// QColor or a QGradient to be used whenever a QBrush is expected.  Note that
// SIP must process QColor before QBrush so that the former's QVariant cast
// operator is applied before the latter's.

if (sipIsErr == NULL)
    return (sipCanConvertToType(sipPy, sipType_QBrush, SIP_NO_CONVERTORS) ||
            sipCanConvertToType(sipPy, sipType_QColor, 0) ||
            sipCanConvertToType(sipPy, sipType_QGradient, 0));

if (sipCanConvertToType(sipPy, sipType_QBrush, SIP_NO_CONVERTORS))
{
    *sipCppPtr = reinterpret_cast<QBrush *>(sipConvertToType(sipPy, sipType_QBrush, sipTransferObj, SIP_NO_CONVERTORS, 0, sipIsErr));

    return 0;
}

int state;

if (sipCanConvertToType(sipPy, sipType_QColor, 0))
{
    QColor *c = reinterpret_cast<QColor *>(sipConvertToType(sipPy, sipType_QColor, 0, 0, &state, sipIsErr));

    if (*sipIsErr)
    {
        sipReleaseType(c, sipType_QColor, state);
        return 0;
    }

    *sipCppPtr = new QBrush(*c);

    sipReleaseType(c, sipType_QColor, state);

    return sipGetState(sipTransferObj);
}

QGradient *g = reinterpret_cast<QGradient *>(sipConvertToType(sipPy, sipType_QGradient, 0, 0, &state, sipIsErr));

if (*sipIsErr)
{
    sipReleaseType(g, sipType_QGradient, state);
    return 0;
}

*sipCppPtr = new QBrush(*g);

sipReleaseType(g, sipType_QGradient, state);

return sipGetState(sipTransferObj);
%End

public:
    QBrush();
    QBrush(Qt::BrushStyle);
    QBrush(const QColor &, Qt::BrushStyle style = Qt::SolidPattern);
    QBrush(Qt::GlobalColor, Qt::BrushStyle style = Qt::SolidPattern);
    QBrush(const QColor &, const QPixmap &);
    QBrush(Qt::GlobalColor, const QPixmap &);
    QBrush(const QPixmap &);
%If (Qt_4_2_0 -)
    QBrush(const QImage &);
%End
    QBrush(const QGradient &);
    QBrush(const QBrush &);
    QBrush(const QVariant &variant) /NoDerived/;
%MethodCode
        sipCpp = new QBrush(qVariantValue<QBrush>(*a0));
%End

    ~QBrush();
    void setStyle(Qt::BrushStyle);
    QPixmap texture() const;
    void setTexture(const QPixmap &);
    void setColor(const QColor &);
    const QGradient *gradient() const;
    bool isOpaque() const;
    bool operator==(const QBrush &) const;
    bool operator!=(const QBrush &) const;
    void setColor(Qt::GlobalColor);
    Qt::BrushStyle style() const;
    const QColor &color() const;
%If (Qt_4_2_0 -)
    void setMatrix(const QMatrix &);
%End
%If (Qt_4_2_0 -)
    const QMatrix &matrix() const;
%End
%If (Qt_4_2_0 -)
    void setTextureImage(const QImage &);
%End
%If (Qt_4_2_0 -)
    QImage textureImage() const;
%End
%If (Qt_4_3_0 -)
    void setTransform(const QTransform &);
%End
%If (Qt_4_3_0 -)
    QTransform transform() const;
%End
};

QDataStream &operator>>(QDataStream &, QBrush & /Constrained/);
QDataStream &operator<<(QDataStream &, const QBrush & /Constrained/);
typedef QVector<QPair<qreal, QColor> > QGradientStops;

class QGradient
{
%TypeHeaderCode
#include <qbrush.h>
%End

public:
%If (Qt_4_4_0 -)

    enum CoordinateMode
    {
        LogicalMode,
        StretchToDeviceMode,
        ObjectBoundingMode,
    };

%End

    enum Type
    {
        LinearGradient,
        RadialGradient,
        ConicalGradient,
        NoGradient,
    };

    enum Spread
    {
        PadSpread,
        ReflectSpread,
        RepeatSpread,
    };

    QGradient();
    QGradient::Type type() const;
    QGradient::Spread spread() const;
    void setColorAt(qreal, const QColor &);
    void setStops(const QGradientStops &);
    QGradientStops stops() const;
    bool operator==(const QGradient &) const;
%If (Qt_4_2_0 -)
    bool operator!=(const QGradient &) const;
%End
    void setSpread(QGradient::Spread);
%If (Qt_4_4_0 -)
    QGradient::CoordinateMode coordinateMode() const;
%End
%If (Qt_4_4_0 -)
    void setCoordinateMode(QGradient::CoordinateMode);
%End
};

class QLinearGradient : QGradient
{
%TypeHeaderCode
#include <qbrush.h>
%End

public:
%If (Qt_4_2_0 -)
    QLinearGradient();
%End
    QLinearGradient(const QPointF &, const QPointF &);
    QLinearGradient(qreal, qreal, qreal, qreal);
    QPointF start() const;
    QPointF finalStop() const;
%If (Qt_4_2_0 -)
    void setStart(const QPointF &);
%End
%If (Qt_4_2_0 -)
    void setStart(qreal, qreal);
%End
%If (Qt_4_2_0 -)
    void setFinalStop(const QPointF &);
%End
%If (Qt_4_2_0 -)
    void setFinalStop(qreal, qreal);
%End
};

class QRadialGradient : QGradient
{
%TypeHeaderCode
#include <qbrush.h>
%End

public:
%If (Qt_4_2_0 -)
    QRadialGradient();
%End
%If (Qt_4_2_0 -)
    QRadialGradient(const QPointF &, qreal, const QPointF &);
%End
%If (Qt_4_2_0 -)
    QRadialGradient(const QPointF &, qreal);
%End
%If (- Qt_4_2_0)
    QRadialGradient(const QPointF &, qreal, const QPointF &focalPoint = QPointF());
%End
%If (Qt_4_2_0 -)
    QRadialGradient(qreal, qreal, qreal, qreal, qreal);
%End
%If (Qt_4_2_0 -)
    QRadialGradient(qreal, qreal, qreal);
%End
%If (- Qt_4_2_0)
    QRadialGradient(qreal, qreal, qreal, qreal fx = 0, qreal fy = 0);
%End
    QPointF center() const;
    QPointF focalPoint() const;
    qreal radius() const;
%If (Qt_4_2_0 -)
    void setCenter(const QPointF &);
%End
%If (Qt_4_2_0 -)
    void setCenter(qreal, qreal);
%End
%If (Qt_4_2_0 -)
    void setFocalPoint(const QPointF &);
%End
%If (Qt_4_2_0 -)
    void setFocalPoint(qreal, qreal);
%End
%If (Qt_4_2_0 -)
    void setRadius(qreal);
%End
};

class QConicalGradient : QGradient
{
%TypeHeaderCode
#include <qbrush.h>
%End

public:
%If (Qt_4_2_0 -)
    QConicalGradient();
%End
    QConicalGradient(const QPointF &, qreal);
    QConicalGradient(qreal, qreal, qreal);
    QPointF center() const;
    qreal angle() const;
%If (Qt_4_2_0 -)
    void setCenter(const QPointF &);
%End
%If (Qt_4_2_0 -)
    void setCenter(qreal, qreal);
%End
%If (Qt_4_2_0 -)
    void setAngle(qreal);
%End
};

%If (Qt_4_3_0 -)
void qSwap(QBrush &, QBrush &);
%End
