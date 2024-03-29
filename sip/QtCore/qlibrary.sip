// qlibrary.sip generated by MetaSIP on Fri Oct 29 15:43:58 2010
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
#include <qlibrary.h>
%End

class QLibrary : QObject
{
%TypeHeaderCode
#include <qlibrary.h>
%End

public:
%If (Qt_4_2_0 -)

    enum LoadHint
    {
        ResolveAllSymbolsHint,
        ExportExternalSymbolsHint,
        LoadArchiveMemberHint,
    };

%End
%If (Qt_4_2_0 -)
    typedef QFlags<QLibrary::LoadHint> LoadHints;
%End
    explicit QLibrary(QObject *parent /TransferThis/ = 0);
    QLibrary(const QString &, QObject *parent /TransferThis/ = 0);
    QLibrary(const QString &, int, QObject *parent /TransferThis/ = 0);
%If (Qt_4_4_0 -)
    QLibrary(const QString &, const QString &, QObject *parent /TransferThis/ = 0);
%End
    virtual ~QLibrary();
%If (Qt_4_2_0 -)
    QString errorString() const;
%End
    QString fileName() const;
    bool isLoaded() const;
    bool load();
%If (Qt_4_2_0 -)
    QFlags<QLibrary::LoadHint> loadHints() const;
%End
    void *resolve(const char *);
    static void *resolve(const QString &, const char *);
    static void *resolve(const QString &, int, const char *);
%If (Qt_4_4_0 -)
    static void *resolve(const QString &, const QString &, const char *);
%End
    bool unload();
    static bool isLibrary(const QString &);
    void setFileName(const QString &);
    void setFileNameAndVersion(const QString &, int);
%If (Qt_4_4_0 -)
    void setFileNameAndVersion(const QString &, const QString &);
%End
%If (Qt_4_2_0 -)
    void setLoadHints(QFlags<QLibrary::LoadHint>);
%End
};

%If (Qt_4_2_0 -)
QFlags<QLibrary::LoadHint> operator|(QLibrary::LoadHint, QFlags<QLibrary::LoadHint>);
%End
