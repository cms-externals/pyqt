// qsql.sip generated by MetaSIP on Fri Oct 29 15:43:58 2010
//
// This file is part of the QtSql Python extension module.
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
#include <qsql.h>
%End

namespace QSql
{
%TypeHeaderCode
#include <qsql.h>
%End

    enum Location
    {
        BeforeFirstRow,
        AfterLastRow,
    };

    enum ParamTypeFlag
    {
        In,
        Out,
        InOut,
        Binary,
    };

    typedef QFlags<QSql::ParamTypeFlag> ParamType;

    enum TableType
    {
        Tables,
        SystemTables,
        Views,
        AllTables,
    };

%If (Qt_4_3_0 -)

    enum NumericalPrecisionPolicy
    {
        LowPrecisionInt32,
        LowPrecisionInt64,
        LowPrecisionDouble,
        HighPrecision,
    };

%End
};

QFlags<QSql::ParamTypeFlag> operator|(QSql::ParamTypeFlag, QFlags<QSql::ParamTypeFlag>);
