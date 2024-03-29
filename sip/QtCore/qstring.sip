// qstring.sip generated by MetaSIP on Fri Oct 29 15:43:58 2010
//
// This file is part of the QtCore Python extension module.
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
#include <qstring.h>
%End

// class QString /AllowNone,API=QString:2 -,DocType="str"/
%MappedType QString /AllowNone,API=QString:2 -,DocType="str"/
{
%TypeHeaderCode
#include <qstring.h>
%End

%ConvertToTypeCode
if (sipIsErr == NULL)
#if PY_MAJOR_VERSION < 3
    return (sipPy == Py_None || PyString_Check(sipPy) || PyUnicode_Check(sipPy));
#else
    return (sipPy == Py_None || PyUnicode_Check(sipPy));
#endif

if (sipPy == Py_None)
{
    // None is the only way to create a null (as opposed to empty) QString.
    *sipCppPtr = new QString();

    return sipGetState(sipTransferObj);
}

#if PY_MAJOR_VERSION < 3
if (PyString_Check(sipPy))
{
    *sipCppPtr = new QString(PyString_AS_STRING(sipPy));

    return sipGetState(sipTransferObj);
}
#endif

*sipCppPtr = new QString(qpycore_PyObject_AsQString(sipPy));

return sipGetState(sipTransferObj);
%End

%ConvertFromTypeCode
    return qpycore_PyObject_FromQString(*sipCpp);
%End
};

class QString /API=QString: - 2/
{
%TypeHeaderCode
#include <qstring.h>
%End

%TypeCode
// This is needed by __hash__().
#include <qhash.h>


// This is needed by the %BIGetCharBufferCode.
#include <qtextcodec.h>
%End

%ConvertToTypeCode
// See the comments for the QByteArray %ConvertToTypeCode for an explanation
// of the conversions that are done below.

if (sipIsErr == NULL)
    return (PyUnicode_Check(sipPy) ||
#if PY_MAJOR_VERSION < 3
            PyString_Check(sipPy) ||
#endif
            sipCanConvertToType(sipPy, sipType_QLatin1String, 0) ||
            sipCanConvertToType(sipPy, sipType_QChar, 0) ||
            sipCanConvertToType(sipPy, sipType_QString, SIP_NO_CONVERTORS));

if (PyUnicode_Check(sipPy))
{
    *sipCppPtr = new QString(qpycore_PyObject_AsQString(sipPy));

    return sipGetState(sipTransferObj);
}

#if PY_MAJOR_VERSION < 3
if (PyString_Check(sipPy))
{
    *sipCppPtr = new QString(PyString_AS_STRING(sipPy));

    return sipGetState(sipTransferObj);
}
#endif

if (sipCanConvertToType(sipPy, sipType_QLatin1String, 0))
{
    int state;
    QLatin1String *q = reinterpret_cast<QLatin1String *>(sipConvertToType(sipPy,
            sipType_QLatin1String, 0, 0, &state, sipIsErr));

    if (*sipIsErr)
    {
        sipReleaseType(q, sipType_QLatin1String, state);
        return 0;
    }

    *sipCppPtr = new QString(*q);

    sipReleaseType(q, sipType_QLatin1String, state);

    return sipGetState(sipTransferObj);
}

if (sipCanConvertToType(sipPy, sipType_QChar, 0))
{
    int state;
    QChar *q = reinterpret_cast<QChar *>(sipConvertToType(sipPy,
            sipType_QChar, 0, 0, &state, sipIsErr));

    if (*sipIsErr)
    {
        sipReleaseType(q, sipType_QChar, state);
        return 0;
    }

    *sipCppPtr = new QString(*q);

    sipReleaseType(q, sipType_QChar, state);

    return sipGetState(sipTransferObj);
}

*sipCppPtr = reinterpret_cast<QString *>(sipConvertToType(sipPy,
        sipType_QString, sipTransferObj, SIP_NO_CONVERTORS, 0, sipIsErr));

return 0;
%End

%BIGetReadBufferCode
    if (sipSegment != 0)
    {
        PyErr_SetString(PyExc_SystemError, "accessing non-existent QString segment");
        sipRes = -1;
    }
    else
    {
        // To keep things easy we convert to a Python Unicode object, keep a
        // reference to it and expose its contents.
        PyObject *uobj = qpycore_PyObject_FromQString(*sipCpp);
    
        if (uobj)
        {
            Py_XDECREF(((sipSimpleWrapper *)sipSelf)->user);
            ((sipSimpleWrapper *)sipSelf)->user = uobj;
    
            *sipPtrPtr = (void *)PyUnicode_AS_UNICODE(uobj);
            sipRes = PyUnicode_GET_DATA_SIZE(uobj);
        }
        else
        {
            sipRes = -1;
        }
    }
%End

%BIGetSegCountCode
    if (sipLenPtr)
        *sipLenPtr = sipCpp->size() * sizeof (Py_UNICODE);
    
    sipRes = 1;
%End

%BIGetCharBufferCode
    if (sipSegment != 0)
    {
        PyErr_SetString(PyExc_SystemError, "accessing non-existent QString segment");
        sipRes = -1;
    }
    else
    {
        static QTextCodec *codec = 0;
        static bool check_codec = TRUE;
    
        // For the first time only, try and find a Qt codec that corresponds to the
        // default Python codec.  If one wasn't found then fall back to ASCII
        // (which is actually the codec returned by QTextCodec::codecForCStrings()).
        if (check_codec)
        {
            codec = QTextCodec::codecForName(PyUnicode_GetDefaultEncoding());
            check_codec = FALSE;
        }
    
        QByteArray enc;
    
        if (codec)
            enc = codec->fromUnicode(*sipCpp);
        else
            enc = sipCpp->toAscii();
    
        // A Python string is the most convenient method to save the encoded
        // version on the heap.
        PyObject *encobj = ((sipSimpleWrapper *)sipSelf)->user;
    
        Py_XDECREF(encobj);
    
        if ((encobj = PyString_FromStringAndSize(enc.data(), enc.size())) != NULL)
        {
            *sipPtrPtr = (void *)PyString_AS_STRING(encobj);
            sipRes = PyString_GET_SIZE(encobj);
    
            ((sipSimpleWrapper *)sipSelf)->user = encobj;
        }
        else
            sipRes = -1;
    }
%End

%PickleCode
    sipRes = Py_BuildValue((char *)"(O)", qpycore_PyObject_FromQString(*sipCpp));
%End

public:
    QString();
    QString(int, QChar);
    QString(const QString &);
    QString(const QByteArray &);
    ~QString();
    SIP_PYOBJECT __repr__() const /DocType="str"/;
%MethodCode
        PyObject *uni = qpycore_PyObject_FromQString(*sipCpp);
        
        if (uni)
        {
        #if PY_MAJOR_VERSION >= 3
            sipRes = PyUnicode_FromFormat("PyQt4.QtCore.QString(%R)", uni);
        #else
            sipRes = PyString_FromString("PyQt4.QtCore.QString(");
            PyString_ConcatAndDel(&sipRes, PyObject_Repr(uni));
            PyString_ConcatAndDel(&sipRes, PyString_FromString(")"));
        #endif
        
            Py_DECREF(uni);
        }
%End

    int size() const;
    int count() const /__len__/;
    void resize(int);
    QString &fill(QChar, int size = -1);
    void truncate(int);
    void chop(int);
    void squeeze();
    QString arg(int /Constrained/, int fieldWidth = 0, int base = 10, const QChar &fillChar = QLatin1Char(' ')) const;
    QString arg(double /Constrained/, int fieldWidth = 0, char format = 'g', int precision = -1, const QChar &fillChar = QLatin1Char(' ')) const;
    QString arg(qlonglong, int fieldWidth = 0, int base = 10, const QChar &fillChar = QLatin1Char(' ')) const;
    QString arg(qulonglong, int fieldWidth = 0, int base = 10, const QChar &fillChar = QLatin1Char(' ')) const;
    QString arg(const QString &, int fieldWidth = 0, const QChar &fillChar = QLatin1Char(' ')) const;
    QString arg(const QString &, const QString &) const;
    QString arg(const QString &, const QString &, const QString &) const;
    QString arg(const QString &, const QString &, const QString &, const QString &) const;
%If (Qt_4_3_0 -)
    QString arg(const QString &, const QString &, const QString &, const QString &, const QString &) const;
%End
%If (Qt_4_3_0 -)
    QString arg(const QString &, const QString &, const QString &, const QString &, const QString &, const QString &) const;
%End
%If (Qt_4_3_0 -)
    QString arg(const QString &, const QString &, const QString &, const QString &, const QString &, const QString &, const QString &) const;
%End
%If (Qt_4_3_0 -)
    QString arg(const QString &, const QString &, const QString &, const QString &, const QString &, const QString &, const QString &, const QString &) const;
%End
%If (Qt_4_3_0 -)
    QString arg(const QString &, const QString &, const QString &, const QString &, const QString &, const QString &, const QString &, const QString &, const QString &) const;
%End
    int count(const QString &, Qt::CaseSensitivity cs = Qt::CaseSensitive) const;
    int count(const QRegExp &) const;
    int indexOf(const QString &, int from = 0, Qt::CaseSensitivity cs = Qt::CaseSensitive) const;
%If (Qt_4_5_0 -)
    int indexOf(const QLatin1String &, int from = 0, Qt::CaseSensitivity cs = Qt::CaseSensitive) const;
%End
    int indexOf(const QRegExp &, int from = 0) const;
    int lastIndexOf(const QString &, int from = -1, Qt::CaseSensitivity cs = Qt::CaseSensitive) const;
%If (Qt_4_5_0 -)
    int lastIndexOf(const QLatin1String &, int from = -1, Qt::CaseSensitivity cs = Qt::CaseSensitive) const;
%End
    int lastIndexOf(const QRegExp &, int from = -1) const;
    QBool contains(const QString &, Qt::CaseSensitivity cs = Qt::CaseSensitive) const;
    QBool contains(const QRegExp &) const;

    enum SectionFlag
    {
        SectionDefault,
        SectionSkipEmpty,
        SectionIncludeLeadingSep,
        SectionIncludeTrailingSep,
        SectionCaseInsensitiveSeps,
    };

    typedef QFlags<QString::SectionFlag> SectionFlags;
    QString section(const QString &, int, int end = -1, QFlags<QString::SectionFlag> flags = SectionDefault) const;
    QString section(const QRegExp &, int, int end = -1, QFlags<QString::SectionFlag> flags = SectionDefault) const;
    QString left(int) const;
    QString right(int) const;
    QString mid(int, int n = -1) const;
    bool startsWith(const QString &, Qt::CaseSensitivity cs = Qt::CaseSensitive) const;
    bool startsWith(const QLatin1String &, Qt::CaseSensitivity cs = Qt::CaseSensitive) const;
    bool endsWith(const QString &, Qt::CaseSensitivity cs = Qt::CaseSensitive) const;
    bool endsWith(const QLatin1String &, Qt::CaseSensitivity cs = Qt::CaseSensitive) const;
    QString leftJustified(int, QChar fillChar = QLatin1Char(' '), bool truncate = false) const;
    QString rightJustified(int, QChar fillChar = QLatin1Char(' '), bool truncate = false) const;
    QString toLower() const;
    QString toUpper() const;
    QString trimmed() const;
    QString simplified() const;
    QString &insert(int, const QString &);
    QString &insert(int, const QLatin1String &);
    QString &append(const QString &);
    QString &append(const QLatin1String &);
    QString &prepend(const QString &);
    QString &prepend(const QLatin1String &);
    QString &operator+=(QChar::SpecialCharacter);
    QString &operator+=(const QString &);
    QString &operator+=(const QLatin1String &);
    QString &remove(int, int);
    QString &remove(const QString &, Qt::CaseSensitivity cs = Qt::CaseSensitive);
    QString &replace(int, int, const QString &);
    QString &replace(const QString &, const QString &, Qt::CaseSensitivity cs = Qt::CaseSensitive);
    QString &replace(const QRegExp &, const QString &);
    QString &remove(const QRegExp &);

    enum SplitBehavior
    {
        KeepEmptyParts,
        SkipEmptyParts,
    };

    QStringList split(const QString &, QString::SplitBehavior behavior = QString::KeepEmptyParts, Qt::CaseSensitivity cs = Qt::CaseSensitive) const;
    QStringList split(const QRegExp &, QString::SplitBehavior behavior = QString::KeepEmptyParts) const;

    enum NormalizationForm
    {
        NormalizationForm_D,
        NormalizationForm_C,
        NormalizationForm_KD,
        NormalizationForm_KC,
    };

    QString normalized(QString::NormalizationForm) const;
    QString normalized(QString::NormalizationForm, QChar::UnicodeVersion) const;
    QByteArray toAscii() const;
    QByteArray toLatin1() const;
    QByteArray toUtf8() const;
    QByteArray toLocal8Bit() const;
    static QString fromAscii(const char * /Encoding="ASCII"/, int size = -1);
    static QString fromLatin1(const char * /Encoding="Latin-1"/, int size = -1);
    static QString fromUtf8(const char * /Encoding="UTF-8"/, int size = -1);
    static QString fromLocal8Bit(const char * /Encoding="None"/, int size = -1);
    int compare(const QString &) const;
%If (Qt_4_2_0 -)
    int compare(const QString &, Qt::CaseSensitivity cs) const;
%End
%If (Qt_4_2_0 -)
    int compare(const QLatin1String &, Qt::CaseSensitivity cs = Qt::CaseSensitive) const;
%End
%If (Qt_4_5_0 -)
    int compare(const QStringRef &, Qt::CaseSensitivity cs = Qt::CaseSensitive) const;
%End
    static int compare(const QString &, const QString &);
%If (Qt_4_2_0 -)
    static int compare(const QString &, const QString &, Qt::CaseSensitivity cs);
%End
%If (Qt_4_2_0 -)
    static int compare(const QString &, const QLatin1String &, Qt::CaseSensitivity cs = Qt::CaseSensitive);
%End
%If (Qt_4_2_0 -)
    static int compare(const QLatin1String &, const QString &, Qt::CaseSensitivity cs = Qt::CaseSensitive);
%End
%If (Qt_4_5_0 -)
    static int compare(const QString &, const QStringRef &, Qt::CaseSensitivity cs = Qt::CaseSensitive);
%End
    int localeAwareCompare(const QString &) const;
%If (Qt_4_5_0 -)
    int localeAwareCompare(const QStringRef &) const;
%End
    static int localeAwareCompare(const QString &, const QString &);
%If (Qt_4_5_0 -)
    static int localeAwareCompare(const QString &, const QStringRef &);
%End
    short toShort(bool *ok = 0, int base = 10) const;
    ushort toUShort(bool *ok = 0, int base = 10) const;
    int toInt(bool *ok = 0, int base = 10) const;
    uint toUInt(bool *ok = 0, int base = 10) const;
    long toLong(bool *ok = 0, int base = 10) const;
    ulong toULong(bool *ok = 0, int base = 10) const;
    qlonglong toLongLong(bool *ok = 0, int base = 10) const;
    qulonglong toULongLong(bool *ok = 0, int base = 10) const;
    float toFloat(bool *ok = 0) const;
    double toDouble(bool *ok = 0) const;
    QString &setNum(int /Constrained/, int base = 10);
    QString &setNum(double /Constrained/, char format = 'g', int precision = 6);
    QString &setNum(qlonglong, int base = 10);
    QString &setNum(qulonglong, int base = 10);
    static QString number(int /Constrained/, int base = 10);
    static QString number(double /Constrained/, char format = 'g', int precision = 6);
    static QString number(qlonglong, int base = 10);
    static QString number(qulonglong, int base = 10);
    bool operator==(const QString &) const;
    bool operator<(const QString &) const;
    bool operator>(const QString &) const;
    bool operator!=(const QString &) const;
    bool operator<=(const QString &) const;
    bool operator>=(const QString &) const;
    bool operator==(const QLatin1String &) const;
    bool operator<(const QLatin1String &) const;
    bool operator>(const QLatin1String &) const;
    bool operator!=(const QLatin1String &) const;
    bool operator<=(const QLatin1String &) const;
    bool operator>=(const QLatin1String &) const;
    QString &prepend(const QByteArray &);
    QString &append(const QByteArray &);
    QString &operator+=(const QByteArray &);
    bool operator==(const QByteArray &) const;
    bool operator!=(const QByteArray &) const;
    bool operator<(const QByteArray &) const;
    bool operator>(const QByteArray &) const;
    bool operator<=(const QByteArray &) const;
    bool operator>=(const QByteArray &) const;
    void push_back(const QString &);
    void push_front(const QString &);
    bool isNull() const;
    bool isSimpleText() const;
    bool isRightToLeft() const;
    int length() const;
    const QChar at(int) const;
    QString operator[](int i) const;
%MethodCode
        // Note that we return a QString (rather than a QChar as Qt does).  This makes
        // things a bit easier in Python (because it doesn't distinguish between
        // characters and strings), although now that a QChar can be used whenever a
        // QString is expected it doesn't really matter.
        SIP_SSIZE_T idx = sipConvertFromSequenceIndex(a0, sipCpp->count());
        
        if (idx < 0)
            sipIsErr = 1;
        else
            sipRes = new QString(sipCpp->operator[]((int)idx));
%End

    QString operator[](SIP_PYSLICE slice) const;
%MethodCode
        SIP_SSIZE_T len, start, stop, step, slicelength, i;
        
        len = sipCpp->length();
        
        if (PySlice_GetIndicesEx((PySliceObject *)a0, len, &start, &stop, &step, &slicelength) < 0)
            sipIsErr = 1;
        else
        {
            sipRes = new QString();
        
            for (i = 0; i < slicelength; ++i)
            {
                sipRes -> append(sipCpp->at(start));
                start += step;
            }
        }
%End

    int __contains__(const QString &s) const;
%MethodCode
        // It looks like you can't assign QBool to int.
        sipRes = bool(sipCpp->contains(*a0));
%End

%If (!Py_v3)
    SIP_PYOBJECT __unicode__() const /DocType="unicode"/;
%MethodCode
        sipRes = qpycore_PyObject_FromQString(*sipCpp);
%End

%End
    SIP_PYOBJECT __str__() const /DocType="str"/;
%MethodCode
        sipRes = qpycore_PyObject_FromQString(*sipCpp);
%End

    long __hash__() const;
%MethodCode
        sipRes = qHash(*sipCpp);
%End

    QString operator*(int m) const;
%MethodCode
        sipRes = new QString();
        
        while (a0-- > 0)
            *sipRes += *sipCpp;
%End

    QString &operator*=(int m);
%MethodCode
        QString orig(*sipCpp);
        
        sipCpp->clear();
        
        while (a0-- > 0)
            *sipCpp += orig;
%End

    bool isEmpty() const;
    void clear();
    int capacity() const;
    void reserve(int);
%If (Qt_4_3_0 -)
    QString toCaseFolded() const;
%End
%If (Qt_4_5_0 -)
    QString &replace(const QLatin1String &, const QLatin1String &, Qt::CaseSensitivity cs = Qt::CaseSensitive);
%End
%If (Qt_4_5_0 -)
    QString &replace(const QLatin1String &, const QString &, Qt::CaseSensitivity cs = Qt::CaseSensitive);
%End
%If (Qt_4_5_0 -)
    QString &replace(const QString &, const QLatin1String &, Qt::CaseSensitivity cs = Qt::CaseSensitive);
%End
%If (Qt_4_5_0 -)
    QString repeated(int) const;
%End
};

class QLatin1String /API=QString: - 2/
{
%TypeHeaderCode
#include <qstring.h>
%End

%PickleCode
    sipRes = Py_BuildValue((char *)"(s)", sipCpp->latin1());
%End

public:
    explicit QLatin1String(const char * /Encoding="Latin-1",KeepReference/);
    SIP_PYOBJECT __repr__() const /DocStr="str"/;
%MethodCode
        PyObject *str = SIPBytes_FromString(sipCpp->latin1());
        
        if (str)
        {
        #if PY_MAJOR_VERSION >= 3
            sipRes = PyUnicode_FromFormat("PyQt4.QtCore.QLatin1String(%R)", str);
        #else
            sipRes = PyString_FromString("PyQt4.QtCore.QLatin1String(");
            PyString_ConcatAndDel(&sipRes, PyObject_Repr(str));
            PyString_ConcatAndDel(&sipRes, PyString_FromString(")"));
        #endif
        
            Py_DECREF(str);
        }
%End

    const char *latin1() const /Encoding="None"/;
    bool operator==(const QString &) const;
    bool operator!=(const QString &) const;
    bool operator>(const QString &) const;
    bool operator<(const QString &) const;
    bool operator>=(const QString &) const;
    bool operator<=(const QString &) const;
};

const QString operator+(const QString &, const QString &) /Numeric/;
const QString operator+(QChar, const QString &) /Numeric/;
const QString operator+(const QByteArray &, const QString &) /Numeric/;
const QString operator+(const QString &, const QByteArray &) /Numeric/;
QDataStream &operator<<(QDataStream &, const QString & /Constrained/) /API=QString: - 2/;
QDataStream &operator>>(QDataStream &, QString & /Constrained/) /API=QString: - 2/;
QFlags<QString::SectionFlag> operator|(QString::SectionFlag, QFlags<QString::SectionFlag>);
%If (Qt_4_3_0 -)
bool operator==(const QLatin1String &, const QLatin1String &);
%End
%If (Qt_4_3_0 -)
bool operator!=(const QLatin1String &, const QLatin1String &);
%End
%If (Qt_4_3_0 -)
bool operator<(const QLatin1String &, const QLatin1String &);
%End
%If (Qt_4_3_0 -)
bool operator<=(const QLatin1String &, const QLatin1String &);
%End
%If (Qt_4_3_0 -)
bool operator>(const QLatin1String &, const QLatin1String &);
%End
%If (Qt_4_3_0 -)
bool operator>=(const QLatin1String &, const QLatin1String &);
%End
%If (Qt_4_3_0 -)
void qSwap(QString &, QString &) /API=QString: - 2/;
%End
%If (Qt_4_3_0 -)
// class QStringRef /API=QString:2 - /
%MappedType QStringRef /API=QString:2 - /
{
%TypeHeaderCode
#include <qstring.h>
%End

%ConvertToTypeCode
    // Qt only ever returns a QStringRef so this conversion isn't needed.
    return 0;
%End

%ConvertFromTypeCode
    return qpycore_PyObject_FromQString(sipCpp->toString());
%End
};
%End
%If (Qt_4_3_0 -)

class QStringRef /API=QString: - 2/
{
%TypeHeaderCode
#include <qstring.h>
%End

public:
    QStringRef();
    QStringRef(const QString *, int, int);
    QStringRef(const QString *);
    QStringRef(const QStringRef &);
    ~QStringRef();
    const QString *string() const;
    int position() const;
    int size() const;
    int count() const /__len__/;
    int length() const;
    const QChar *unicode() const;
    const QChar *data() const;
    const QChar *constData() const;
    void clear();
    QString toString() const;
    bool isEmpty() const;
    bool isNull() const;
    QStringRef appendTo(QString *) const;
    const QChar at(int) const;
%If (Qt_4_5_0 -)
    int compare(const QString &, Qt::CaseSensitivity cs = Qt::CaseSensitive) const;
%End
%If (Qt_4_5_0 -)
    int compare(const QStringRef &, Qt::CaseSensitivity cs = Qt::CaseSensitive) const;
%End
%If (Qt_4_5_0 -)
    int compare(QLatin1String, Qt::CaseSensitivity cs = Qt::CaseSensitive) const;
%End
%If (Qt_4_5_0 -)
    static int compare(const QStringRef &, const QString &, Qt::CaseSensitivity cs = Qt::CaseSensitive);
%End
%If (Qt_4_5_0 -)
    static int compare(const QStringRef &, const QStringRef &, Qt::CaseSensitivity cs = Qt::CaseSensitive);
%End
%If (Qt_4_5_0 -)
    static int compare(const QStringRef &, QLatin1String, Qt::CaseSensitivity cs = Qt::CaseSensitive);
%End
%If (Qt_4_5_0 -)
    int localeAwareCompare(const QString &) const;
%End
%If (Qt_4_5_0 -)
    int localeAwareCompare(const QStringRef &) const;
%End
%If (Qt_4_5_0 -)
    static int localeAwareCompare(const QStringRef &, const QString &);
%End
%If (Qt_4_5_0 -)
    static int localeAwareCompare(const QStringRef &, const QStringRef &);
%End
%If (!Py_v3)
    SIP_PYOBJECT __unicode__() const /DocType="unicode"/;
%MethodCode
        sipRes = qpycore_PyObject_FromQString(sipCpp->toString());
%End

%End
    SIP_PYOBJECT __str__() const /DocType="str"/;
%MethodCode
        sipRes = qpycore_PyObject_FromQString(sipCpp->toString());
%End
};

%End
%If (Qt_4_3_0 -)
bool operator==(const QStringRef &, const QStringRef &);
%End
%If (Qt_4_3_0 -)
bool operator!=(const QStringRef &, const QStringRef &);
%End
%If (Qt_4_3_0 -)
bool operator==(const QString &, const QStringRef &);
%End
%If (Qt_4_3_0 -)
bool operator!=(const QString &, const QStringRef &);
%End
%If (Qt_4_3_0 -)
bool operator==(const QStringRef &, const QString &);
%End
%If (Qt_4_3_0 -)
bool operator!=(const QStringRef &, const QString &);
%End
%If (Qt_4_3_0 -)
bool operator==(const QLatin1String &, const QStringRef &);
%End
%If (Qt_4_3_0 -)
bool operator!=(const QLatin1String &, const QStringRef &);
%End
%If (Qt_4_3_0 -)
bool operator==(const QStringRef &, const QLatin1String &);
%End
%If (Qt_4_3_0 -)
bool operator!=(const QStringRef &, const QLatin1String &);
%End
%If (Qt_4_3_0 -)
bool operator<(const QStringRef &, const QStringRef &);
%End
%If (Qt_4_3_0 -)
bool operator>(const QStringRef &, const QStringRef &);
%End
%If (Qt_4_3_0 -)
bool operator<=(const QStringRef &, const QStringRef &);
%End
%If (Qt_4_3_0 -)
bool operator>=(const QStringRef &, const QStringRef &);
%End
