// qimage.sip generated by MetaSIP on Fri Oct 29 15:43:58 2010
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
#include <qimage.h>
%End

class QImage : QPaintDevice
{
%TypeHeaderCode
#include <qimage.h>
%End

public:
    enum InvertMode
    {
        InvertRgb,
        InvertRgba,
    };

    enum Format
    {
        Format_Invalid,
        Format_Mono,
        Format_MonoLSB,
        Format_Indexed8,
        Format_RGB32,
        Format_ARGB32,
        Format_ARGB32_Premultiplied,
%If (Qt_4_2_0 -)
        Format_RGB16,
%End
%If (Qt_4_4_0 -)
        Format_ARGB8565_Premultiplied,
%End
%If (Qt_4_4_0 -)
        Format_RGB666,
%End
%If (Qt_4_4_0 -)
        Format_ARGB6666_Premultiplied,
%End
%If (Qt_4_4_0 -)
        Format_RGB555,
%End
%If (Qt_4_4_0 -)
        Format_ARGB8555_Premultiplied,
%End
%If (Qt_4_4_0 -)
        Format_RGB888,
%End
%If (Qt_4_4_0 -)
        Format_RGB444,
%End
%If (Qt_4_4_0 -)
        Format_ARGB4444_Premultiplied,
%End
    };

    QImage();
    QImage(const QSize &, QImage::Format);
    QImage(int, int, QImage::Format);
%If (Qt_4_2_0 -)
    QImage(const uchar * /KeepReference/, int, int, QImage::Format);
%End
%If (- Qt_4_2_0)
    QImage(uchar * /KeepReference/, int, int, QImage::Format);
%End
%If (Qt_4_3_0 -)
    QImage(void *, int, int, QImage::Format) [(uchar *data, int width, int height, QImage::Format format)];
%End
%If (Qt_4_3_0 -)
    QImage(const uchar * /KeepReference/, int, int, int, QImage::Format);
%End
%If (Qt_4_3_0 -)
    QImage(void *, int, int, int, QImage::Format) [(uchar *data, int width, int height, int bytesPerLine, QImage::Format format)];
%End
    explicit QImage(SIP_PYLIST xpm /DocType="list-of-str"/) [(const char **xpm)];
%MethodCode
        // The Python interface is a list of strings that make up the image.
        
        const char **str = QtGui_ListToArray(a0);
        
        if (str)
        {
            sipCpp = new sipQImage(str);
            QtGui_DeleteArray(str);
        }
        else
            sipIsErr = 1;
%End

    QImage(const QString &, const char *format = 0);
    QImage(const QImage &);
    QImage(const QVariant &variant) /NoDerived/;
%MethodCode
        sipCpp = new sipQImage(qVariantValue<QImage>(*a0));
%End

    virtual ~QImage();
    bool isNull() const;
    virtual int devType() const;
    bool operator==(const QImage &) const;
    bool operator!=(const QImage &) const;
    void detach();
    bool isDetached() const;
    QImage copy(const QRect &rect = QRect()) const;
    QImage copy(int, int, int, int) const;
    QImage::Format format() const;
    QImage convertToFormat(QImage::Format, Qt::ImageConversionFlags flags = Qt::AutoColor) const;
    QImage convertToFormat(QImage::Format, const QVector<unsigned int> &, Qt::ImageConversionFlags flags = Qt::AutoColor) const;
    int width() const;
    int height() const;
    QSize size() const;
    QRect rect() const;
    int depth() const;
    int numColors() const;
    QRgb color(int) const;
    void setColor(int, QRgb);
    void setNumColors(int);
    bool allGray() const;
    bool isGrayscale() const;
    void *bits() [uchar * ()];
    int numBytes() const;
    void *scanLine(int) [uchar * (int)];
    int bytesPerLine() const;
%If (Qt_4_2_0 -)
    bool valid(const QPoint &) const;
%End
    bool valid(int, int) const;
%If (Qt_4_2_0 -)
    int pixelIndex(const QPoint &) const;
%End
    int pixelIndex(int, int) const;
%If (Qt_4_2_0 -)
    QRgb pixel(const QPoint &) const;
%End
    QRgb pixel(int, int) const;
%If (Qt_4_2_0 -)
    void setPixel(const QPoint &, uint);
%End
    void setPixel(int, int, uint);
    QVector<unsigned int> colorTable() const;
    void setColorTable(const QVector<unsigned int>);
    void fill(uint);
    bool hasAlphaChannel() const;
    void setAlphaChannel(const QImage &);
    QImage alphaChannel() const;
    QImage createAlphaMask(Qt::ImageConversionFlags flags = Qt::AutoColor) const;
    QImage createHeuristicMask(bool clipTight = true) const;
    QImage scaled(int, int, Qt::AspectRatioMode aspectRatioMode = Qt::IgnoreAspectRatio, Qt::TransformationMode transformMode = Qt::FastTransformation) const;
    QImage scaled(const QSize &, Qt::AspectRatioMode aspectRatioMode = Qt::IgnoreAspectRatio, Qt::TransformationMode transformMode = Qt::FastTransformation) const;
    QImage scaledToWidth(int, Qt::TransformationMode mode = Qt::FastTransformation) const;
    QImage scaledToHeight(int, Qt::TransformationMode mode = Qt::FastTransformation) const;
    QImage transformed(const QMatrix &, Qt::TransformationMode mode = Qt::FastTransformation) const;
    static QMatrix trueMatrix(const QMatrix &, int, int);
    QImage mirrored(bool horizontal = false, bool vertical = true) const;
    QImage rgbSwapped() const;
    void invertPixels(QImage::InvertMode mode = QImage::InvertRgb);
    bool load(QIODevice *, const char *);
    bool load(const QString &, const char *format = 0);
    bool loadFromData(const uchar * /Array/, int /ArraySize/, const char *format = 0);
    bool loadFromData(const QByteArray &, const char *format = 0);
%If (Qt_4_2_0 -)
    bool save(const QString &, const char *format = 0, int quality = -1) const;
%End
%If (- Qt_4_2_0)
    bool save(const QString &, const char *, int quality = -1) const;
%End
%If (Qt_4_2_0 -)
    bool save(QIODevice *, const char *format = 0, int quality = -1) const;
%End
%If (- Qt_4_2_0)
    bool save(QIODevice *, const char *, int quality = -1) const;
%End
    static QImage fromData(const uchar * /Array/, int /ArraySize/, const char *format = 0);
    static QImage fromData(const QByteArray &, const char *format = 0);
    int serialNumber() const;
    virtual QPaintEngine *paintEngine() const;
    int dotsPerMeterX() const;
    int dotsPerMeterY() const;
    void setDotsPerMeterX(int);
    void setDotsPerMeterY(int);
    QPoint offset() const;
    void setOffset(const QPoint &);
    QStringList textKeys() const;
    QString text(const QString &key /DocValue="Py_v3:''"/ = QString()) const;
    void setText(const QString &, const QString &);

protected:
    virtual int metric(QPaintDevice::PaintDeviceMetric) const;

public:
%If (Qt_4_3_0 -)
    QImage createMaskFromColor(QRgb, Qt::MaskMode mode = Qt::MaskInColor) const;
%End
%If (Qt_4_3_0 -)
    QImage transformed(const QTransform &, Qt::TransformationMode mode = Qt::FastTransformation) const;
%End
%If (Qt_4_3_0 -)
    static QTransform trueMatrix(const QTransform &, int, int);
%End
%If (Qt_4_3_0 -)
    qint64 cacheKey() const;
%End
%If (Qt_4_6_0 -)
    int colorCount() const;
%End
%If (Qt_4_6_0 -)
    void setColorCount(int);
%End
%If (Qt_4_6_0 -)
    int byteCount() const;
%End
%If (Qt_4_7_0 -)
    int bitPlaneCount() const;
%End
};

QDataStream &operator<<(QDataStream &, const QImage & /Constrained/);
QDataStream &operator>>(QDataStream &, QImage & /Constrained/);
%If (Qt_4_3_0 -)
void qSwap(QImage &, QImage &);
%End

%ModuleHeaderCode
const char **QtGui_ListToArray(PyObject *lst);
void QtGui_DeleteArray(const char **arr);
%End

%ModuleCode
// Convert a list of strings to an array of ASCII strings on the heap.  Used by
// QImage and QPixmap.
const char **QtGui_ListToArray(PyObject *lst)
{
    SIP_SSIZE_T nstr = PyList_Size(lst);
    const char **arr = new const char *[nstr + 1];

    for (SIP_SSIZE_T i = 0; i < nstr; ++i)
    {
        PyObject *ascii_obj = PyList_GetItem(lst, i);
        const char *ascii = sipString_AsASCIIString(&ascii_obj);

        if (!ascii)
        {
            while (i-- > 0)
                delete[] arr[i];

            delete[] arr;

            return 0;
        }

        // Copy the string.
        arr[i] = qstrdup(ascii);

        Py_DECREF(ascii_obj);
    }

    // The sentinal.
    arr[nstr] = 0;

    return arr;
}


// Return a string array created by QtGui_ListToArray() to the heap.
void QtGui_DeleteArray(const char **arr)
{
    for (SIP_SSIZE_T i = 0; arr[i]; ++i)
        delete[] arr[i];

    delete[] arr;
}
%End
