// qsqldriver.sip generated by MetaSIP on Fri Oct 29 15:43:58 2010
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


class QSqlDriver : QObject
{
%TypeHeaderCode
#include <qsqldriver.h>
%End

%ConvertToSubClassCode
    static struct class_graph {
            const char *name;
            sipTypeDef **type;
            int yes, no;
        } graph[] = {
            {sipName_QSqlQueryModel,	&sipType_QSqlQueryModel,	3, 1},
            {sipName_QSqlRelationalDelegate,	&sipType_QSqlRelationalDelegate,	-1, 2},
            {sipName_QSqlDriver,	&sipType_QSqlDriver,	-1, -1},
            {sipName_QSqlTableModel,	&sipType_QSqlTableModel,	4, -1},
            {sipName_QSqlRelationalTableModel,	&sipType_QSqlRelationalTableModel,	-1, -1},
        };
    
        int i = 0;
    
        sipType = 0;
    
        do
        {
            struct class_graph *cg = &graph[i];
    
            if (cg->name != NULL && sipCpp->inherits(cg->name))
            {
                sipType = *cg->type;
                i = cg->yes;
            }
            else
                i = cg->no;
        }
        while (i >= 0);
%End

public:
    enum DriverFeature
    {
        Transactions,
        QuerySize,
        BLOB,
        Unicode,
        PreparedQueries,
        NamedPlaceholders,
        PositionalPlaceholders,
        LastInsertId,
        BatchOperations,
%If (Qt_4_3_0 -)
        SimpleLocking,
%End
%If (Qt_4_3_0 -)
        LowPrecisionNumbers,
%End
%If (Qt_4_4_0 -)
        EventNotifications,
%End
%If (Qt_4_4_0 -)
        FinishQuery,
%End
%If (Qt_4_4_0 -)
        MultipleResultSets,
%End
    };

    enum StatementType
    {
        WhereStatement,
        SelectStatement,
        UpdateStatement,
        InsertStatement,
        DeleteStatement,
    };

    enum IdentifierType
    {
        FieldName,
        TableName,
    };

    explicit QSqlDriver(QObject *parent /TransferThis/ = 0);
    virtual ~QSqlDriver();
    virtual bool isOpen() const;
    bool isOpenError() const;
    virtual bool beginTransaction() /ReleaseGIL/;
    virtual bool commitTransaction() /ReleaseGIL/;
    virtual bool rollbackTransaction() /ReleaseGIL/;
    virtual QStringList tables(QSql::TableType) const;
    virtual QSqlIndex primaryIndex(const QString &) const;
    virtual QSqlRecord record(const QString &) const;
    virtual QString formatValue(const QSqlField &, bool trimStrings = false) const;
    virtual QString escapeIdentifier(const QString &, QSqlDriver::IdentifierType) const;
    virtual QString sqlStatement(QSqlDriver::StatementType, const QString &, const QSqlRecord &, bool) const;
    QSqlError lastError() const;
    virtual QVariant handle() const;
    virtual bool hasFeature(QSqlDriver::DriverFeature) const = 0;
    virtual void close() = 0;
    virtual QSqlResult *createResult() const = 0 /Factory/;
    virtual bool open(const QString &, const QString &user /DocValue="Py_v3:''"/ = QString(), const QString &password /DocValue="Py_v3:''"/ = QString(), const QString &host /DocValue="Py_v3:''"/ = QString(), int port = -1, const QString &options /DocValue="Py_v3:''"/ = QString()) = 0 /ReleaseGIL/;

protected:
    virtual void setOpen(bool);
    virtual void setOpenError(bool);
    virtual void setLastError(const QSqlError &);

public:
%If (Qt_4_4_0 -)
    bool subscribeToNotification(const QString &);
%End
%If (Qt_4_4_0 -)
    bool unsubscribeFromNotification(const QString &);
%End
%If (Qt_4_4_0 -)
    QStringList subscribedToNotifications() const;
%End

signals:
%If (Qt_4_4_0 -)
    void notification(const QString &);
%End

protected slots:
%If (Qt_4_4_0 -)
    bool subscribeToNotificationImplementation(const QString &);
%End
%If (Qt_4_4_0 -)
    bool unsubscribeFromNotificationImplementation(const QString &);
%End
%If (Qt_4_4_0 -)
    QStringList subscribedToNotificationsImplementation() const;
%End
%If (Qt_4_6_0 -)
    bool isIdentifierEscapedImplementation(const QString &, QSqlDriver::IdentifierType) const;
%End
%If (Qt_4_6_0 -)
    QString stripDelimitersImplementation(const QString &, QSqlDriver::IdentifierType) const;
%End

public:
%If (Qt_4_6_0 -)
    bool isIdentifierEscaped(const QString &, QSqlDriver::IdentifierType) const;
%End
%If (Qt_4_6_0 -)
    QString stripDelimiters(const QString &, QSqlDriver::IdentifierType) const;
%End
%If (Qt_4_6_0 -)
    void setNumericalPrecisionPolicy(QSql::NumericalPrecisionPolicy);
%End
%If (Qt_4_6_0 -)
    QSql::NumericalPrecisionPolicy numericalPrecisionPolicy() const;
%End

private:
    QSqlDriver(const QSqlDriver &);
};
