// qsqlquery.sip generated by MetaSIP on Fri Oct 29 15:43:58 2010
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


class QSqlQuery
{
%TypeHeaderCode
#include <qsqlquery.h>
%End

public:
%If (Qt_4_2_0 -)

    enum BatchExecutionMode
    {
        ValuesAsRows,
        ValuesAsColumns,
    };

%End
    QSqlQuery(QSqlResult *);
    QSqlQuery(const QString &query /DocValue="Py_v3:''"/ = QString(), QSqlDatabase db = QSqlDatabase());
    explicit QSqlQuery(QSqlDatabase);
    QSqlQuery(const QSqlQuery &);
    ~QSqlQuery();
    bool isValid() const;
    bool isActive() const;
    bool isNull(int) const;
    int at() const;
    QString lastQuery() const;
    int numRowsAffected() const;
    QSqlError lastError() const;
    bool isSelect() const;
    int size() const;
    const QSqlDriver *driver() const;
    const QSqlResult *result() const;
    bool isForwardOnly() const;
    QSqlRecord record() const;
    void setForwardOnly(bool);
    bool exec(const QString &) /PyName=exec_,ReleaseGIL/;
%If (Py_v3)
    bool exec(const QString &query) /ReleaseGIL/;
%End
    QVariant value(int) const;
    bool seek(int, bool relative = false) /ReleaseGIL/;
    bool next() /ReleaseGIL/;
    bool previous() /ReleaseGIL/;
    bool first() /ReleaseGIL/;
    bool last() /ReleaseGIL/;
    void clear() /ReleaseGIL/;
    bool exec() /PyName=exec_,ReleaseGIL/;
%If (Qt_4_2_0 -)
    bool execBatch(QSqlQuery::BatchExecutionMode mode = QSqlQuery::ValuesAsRows);
%End
    bool prepare(const QString &) /ReleaseGIL/;
    void bindValue(const QString &, const QVariant &, QSql::ParamType type = QSql::In);
    void bindValue(int, const QVariant &, QSql::ParamType type = QSql::In);
    void addBindValue(const QVariant &, QSql::ParamType type = QSql::In);
    QVariant boundValue(const QString &) const;
    QVariant boundValue(int) const;
    QMap<QString,QVariant> boundValues() const;
    QString executedQuery() const;
    QVariant lastInsertId() const;
%If (Qt_4_3_0 -)
    void setNumericalPrecisionPolicy(QSql::NumericalPrecisionPolicy);
%End
%If (Qt_4_3_0 -)
    QSql::NumericalPrecisionPolicy numericalPrecisionPolicy() const;
%End
%If (Qt_4_4_0 -)
    void finish();
%End
%If (Qt_4_4_0 -)
    bool nextResult();
%End
};
