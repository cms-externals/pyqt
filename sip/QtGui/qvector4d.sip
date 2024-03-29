// qvector4d.sip generated by MetaSIP on Fri Oct 29 15:43:58 2010
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
#include <qvector4d.h>
%End
%End

%If (Qt_4_6_0 -)

class QVector4D
{
%TypeHeaderCode
#include <qvector4d.h>
%End

%PickleCode
    sipRes = Py_BuildValue((char *)"dddd", sipCpp->x(), sipCpp->y(), sipCpp->z(),
            sipCpp->w());
%End

public:
    QVector4D();
    QVector4D(qreal, qreal, qreal, qreal);
    explicit QVector4D(const QPoint &);
    explicit QVector4D(const QPointF &);
    QVector4D(const QVector2D &);
    QVector4D(const QVector2D &, qreal, qreal);
    QVector4D(const QVector3D &);
    QVector4D(const QVector3D &, qreal);
    SIP_PYOBJECT __repr__() const /DocType="str"/;
%MethodCode
        PyObject *x = PyFloat_FromDouble(sipCpp->x());
        PyObject *y = PyFloat_FromDouble(sipCpp->y());
        PyObject *z = PyFloat_FromDouble(sipCpp->z());
        PyObject *w = PyFloat_FromDouble(sipCpp->w());
        
        if (x && y && z && w)
        {
        #if PY_MAJOR_VERSION >= 3
            sipRes = PyUnicode_FromFormat("PyQt4.QtGui.QVector4D(%R, %R, %R, %R)", x,
                    y, z, w);
        #else
            sipRes = PyString_FromString("PyQt4.QtGui.QVector4D(");
            PyString_ConcatAndDel(&sipRes, PyObject_Repr(x));
            PyString_ConcatAndDel(&sipRes, PyString_FromString(", "));
            PyString_ConcatAndDel(&sipRes, PyObject_Repr(y));
            PyString_ConcatAndDel(&sipRes, PyString_FromString(", "));
            PyString_ConcatAndDel(&sipRes, PyObject_Repr(z));
            PyString_ConcatAndDel(&sipRes, PyString_FromString(", "));
            PyString_ConcatAndDel(&sipRes, PyObject_Repr(w));
            PyString_ConcatAndDel(&sipRes, PyString_FromString(")"));
        #endif
        }
        
        Py_XDECREF(x);
        Py_XDECREF(y);
        Py_XDECREF(z);
        Py_XDECREF(w);
%End

    qreal length() const;
    qreal lengthSquared() const;
    QVector4D normalized() const;
    void normalize();
    static qreal dotProduct(const QVector4D &, const QVector4D &);
    QVector2D toVector2D() const;
    QVector2D toVector2DAffine() const;
    QVector3D toVector3D() const;
    QVector3D toVector3DAffine() const;
    bool isNull() const;
    qreal x() const;
    qreal y() const;
    qreal z() const;
    qreal w() const;
    void setX(qreal);
    void setY(qreal);
    void setZ(qreal);
    void setW(qreal);
    QVector4D &operator+=(const QVector4D &);
    QVector4D &operator-=(const QVector4D &);
    QVector4D &operator*=(qreal);
    QVector4D &operator*=(const QVector4D &);
    QVector4D &operator/=(qreal);
    QPoint toPoint() const;
    QPointF toPointF() const;
};

%End
%If (Qt_4_6_0 -)
bool operator==(const QVector4D &, const QVector4D &);
%End
%If (Qt_4_6_0 -)
bool operator!=(const QVector4D &, const QVector4D &);
%End
%If (Qt_4_6_0 -)
const QVector4D operator+(const QVector4D &, const QVector4D &);
%End
%If (Qt_4_6_0 -)
const QVector4D operator-(const QVector4D &, const QVector4D &);
%End
%If (Qt_4_6_0 -)
const QVector4D operator*(qreal, const QVector4D &);
%End
%If (Qt_4_6_0 -)
const QVector4D operator*(const QVector4D &, qreal);
%End
%If (Qt_4_6_0 -)
const QVector4D operator*(const QVector4D &, const QVector4D &);
%End
%If (Qt_4_6_0 -)
const QVector4D operator-(const QVector4D &);
%End
%If (Qt_4_6_0 -)
const QVector4D operator/(const QVector4D &, qreal);
%End
%If (Qt_4_6_0 -)
bool qFuzzyCompare(const QVector4D &, const QVector4D &);
%End
%If (Qt_4_6_0 -)
QDataStream &operator<<(QDataStream &, const QVector4D & /Constrained/);
%End
%If (Qt_4_6_0 -)
QDataStream &operator>>(QDataStream &, QVector4D & /Constrained/);
%End
