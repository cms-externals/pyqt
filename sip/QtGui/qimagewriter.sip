// qimagewriter.sip generated by MetaSIP on Fri Oct 29 15:43:58 2010
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


class QImageWriter
{
%TypeHeaderCode
#include <qimagewriter.h>
%End

public:
    enum ImageWriterError
    {
        UnknownError,
        DeviceError,
        UnsupportedFormatError,
    };

    QImageWriter();
    QImageWriter(QIODevice *, const QByteArray &);
    QImageWriter(const QString &, const QByteArray &format = QByteArray());
    ~QImageWriter();
    void setFormat(const QByteArray &);
    QByteArray format() const;
    void setDevice(QIODevice *);
    QIODevice *device() const;
    void setFileName(const QString &);
    QString fileName() const;
    void setQuality(int);
    int quality() const;
    void setGamma(float);
    float gamma() const;
    void setDescription(const QString &);
    QString description() const;
    bool canWrite() const;
    bool write(const QImage &) /ReleaseGIL/;
    QImageWriter::ImageWriterError error() const;
    QString errorString() const;
    static QList<QByteArray> supportedImageFormats();
    void setText(const QString &, const QString &);
%If (Qt_4_2_0 -)
    bool supportsOption(QImageIOHandler::ImageOption) const;
%End
%If (Qt_4_3_0 -)
    void setCompression(int);
%End
%If (Qt_4_3_0 -)
    int compression() const;
%End

private:
    QImageWriter(const QImageWriter &);
};
