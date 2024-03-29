// qgraphicseffect.sip generated by MetaSIP on Fri Oct 29 15:43:58 2010
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


%If (Qt_4_6_0 -)
%ModuleCode
#include <qgraphicseffect.h>
%End
%End

%If (Qt_4_6_0 -)

class QGraphicsEffect : QObject
{
%TypeHeaderCode
#include <qgraphicseffect.h>
%End

public:
    enum ChangeFlag
    {
        SourceAttached,
        SourceDetached,
        SourceBoundingRectChanged,
        SourceInvalidated,
    };

    typedef QFlags<QGraphicsEffect::ChangeFlag> ChangeFlags;

    enum PixmapPadMode
    {
        NoPad,
        PadToTransparentBorder,
        PadToEffectiveBoundingRect,
    };

    QGraphicsEffect(QObject *parent /TransferThis/ = 0);
    virtual ~QGraphicsEffect();
    virtual QRectF boundingRectFor(const QRectF &) const;
    QRectF boundingRect() const;
    bool isEnabled() const;

public slots:
    void setEnabled(bool);
    void update();

signals:
    void enabledChanged(bool);

protected:
    virtual void draw(QPainter *) = 0;
    virtual void sourceChanged(QFlags<QGraphicsEffect::ChangeFlag>);
    void updateBoundingRect();
    bool sourceIsPixmap() const;
    QRectF sourceBoundingRect(Qt::CoordinateSystem system = Qt::LogicalCoordinates) const;
    void drawSource(QPainter *);
    QPixmap sourcePixmap(Qt::CoordinateSystem system = Qt::LogicalCoordinates, QPoint *offset /Out/ = 0, QGraphicsEffect::PixmapPadMode mode = QGraphicsEffect::PadToEffectiveBoundingRect) const;

private:
    QGraphicsEffect(const QGraphicsEffect &);
};

%End
%If (Qt_4_6_0 -)
QFlags<QGraphicsEffect::ChangeFlag> operator|(QGraphicsEffect::ChangeFlag, QFlags<QGraphicsEffect::ChangeFlag>);
%End
%If (Qt_4_6_0 -)

class QGraphicsColorizeEffect : QGraphicsEffect
{
%TypeHeaderCode
#include <qgraphicseffect.h>
%End

public:
    QGraphicsColorizeEffect(QObject *parent /TransferThis/ = 0);
    virtual ~QGraphicsColorizeEffect();
    QColor color() const;
    qreal strength() const;

public slots:
    void setColor(const QColor &);
    void setStrength(qreal);

signals:
    void colorChanged(const QColor &);
    void strengthChanged(qreal);

protected:
    virtual void draw(QPainter *);

private:
    QGraphicsColorizeEffect(const QGraphicsColorizeEffect &);
};

%End
%If (Qt_4_6_0 -)

class QGraphicsBlurEffect : QGraphicsEffect
{
%TypeHeaderCode
#include <qgraphicseffect.h>
%End

public:
    enum BlurHint
    {
        PerformanceHint,
        QualityHint,
        AnimationHint,
    };

    typedef QFlags<QGraphicsBlurEffect::BlurHint> BlurHints;
    QGraphicsBlurEffect(QObject *parent /TransferThis/ = 0);
    virtual ~QGraphicsBlurEffect();
    virtual QRectF boundingRectFor(const QRectF &) const;
    qreal blurRadius() const;
    QFlags<QGraphicsBlurEffect::BlurHint> blurHints() const;

public slots:
    void setBlurRadius(qreal);
    void setBlurHints(QFlags<QGraphicsBlurEffect::BlurHint>);

signals:
    void blurRadiusChanged(qreal);
    void blurHintsChanged(QFlags<QGraphicsBlurEffect::BlurHint>);

protected:
    virtual void draw(QPainter *);

private:
    QGraphicsBlurEffect(const QGraphicsBlurEffect &);
};

%End
%If (Qt_4_6_0 -)
QFlags<QGraphicsBlurEffect::BlurHint> operator|(QGraphicsBlurEffect::BlurHint, QFlags<QGraphicsBlurEffect::BlurHint>);
%End
%If (Qt_4_6_0 -)

class QGraphicsDropShadowEffect : QGraphicsEffect
{
%TypeHeaderCode
#include <qgraphicseffect.h>
%End

public:
    QGraphicsDropShadowEffect(QObject *parent /TransferThis/ = 0);
    virtual ~QGraphicsDropShadowEffect();
    virtual QRectF boundingRectFor(const QRectF &) const;
    QPointF offset() const;
    qreal xOffset() const;
    qreal yOffset() const;
    qreal blurRadius() const;
    QColor color() const;

public slots:
    void setOffset(const QPointF &);
    void setOffset(qreal, qreal);
    void setOffset(qreal);
    void setXOffset(qreal);
    void setYOffset(qreal);
    void setBlurRadius(qreal);
    void setColor(const QColor &);

signals:
    void offsetChanged(const QPointF &);
    void blurRadiusChanged(qreal);
    void colorChanged(const QColor &);

protected:
    virtual void draw(QPainter *);

private:
    QGraphicsDropShadowEffect(const QGraphicsDropShadowEffect &);
};

%End
%If (Qt_4_6_0 -)

class QGraphicsOpacityEffect : QGraphicsEffect
{
%TypeHeaderCode
#include <qgraphicseffect.h>
%End

public:
    QGraphicsOpacityEffect(QObject *parent /TransferThis/ = 0);
    virtual ~QGraphicsOpacityEffect();
    qreal opacity() const;
    QBrush opacityMask() const;

public slots:
    void setOpacity(qreal);
    void setOpacityMask(const QBrush &);

signals:
    void opacityChanged(qreal);
    void opacityMaskChanged(const QBrush &);

protected:
    virtual void draw(QPainter *);

private:
    QGraphicsOpacityEffect(const QGraphicsOpacityEffect &);
};

%End
