// qwebview.sip generated by MetaSIP on Fri Oct 29 15:43:58 2010
//
// This file is part of the QtWebKit Python extension module.
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


%If (Qt_4_4_0 -)

class QWebView : QWidget
{
%TypeHeaderCode
#include <qwebview.h>
%End

%ConvertToSubClassCode
    static struct class_graph {
            const char *name;
            sipTypeDef **type;
            int yes, no;
        } graph[] = {
            {sipName_QWebPluginFactory, &sipType_QWebPluginFactory, -1, 1},
            {sipName_QWebFrame, &sipType_QWebFrame, -1, 2},
            {sipName_QWebPage, &sipType_QWebPage, -1, 3},
            {sipName_QWebHistoryInterface, &sipType_QWebHistoryInterface, -1, 4},
            {sipName_QWebView, &sipType_QWebView, -1, 5},
    #if QT_VERSION >= 0x040600
            {sipName_QWebInspector, &sipType_QWebInspector, -1, 6},
            {sipName_QGraphicsWebView, &sipType_QGraphicsWebView, -1, -1},
    #else
            {0, 0, -1, 6},
            {0, 0, -1, -1},
    #endif
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
    explicit QWebView(QWidget *parent /TransferThis/ = 0);
    virtual ~QWebView();
    QWebPage *page() const;
    void setPage(QWebPage * /KeepReference/);
    void load(const QUrl &) /ReleaseGIL/;
    void load(const QNetworkRequest &, QNetworkAccessManager::Operation operation = QNetworkAccessManager::GetOperation, const QByteArray &body = QByteArray()) /ReleaseGIL/;
    void setHtml(const QString &, const QUrl &baseUrl = QUrl());
    void setContent(const QByteArray &, const QString &mimeType /DocValue="Py_v3:''"/ = QString(), const QUrl &baseUrl = QUrl());
    QWebHistory *history() const;
    QWebSettings *settings() const;
    QString title() const;
    void setUrl(const QUrl &);
    QUrl url() const;
    QIcon icon() const;
    QString selectedText() const;
    QAction *pageAction(QWebPage::WebAction) const;
    void triggerPageAction(QWebPage::WebAction, bool checked = false);
    bool isModified() const;
    virtual QVariant inputMethodQuery(Qt::InputMethodQuery) const;
    virtual QSize sizeHint() const;
    void setTextSizeMultiplier(qreal);
    qreal textSizeMultiplier() const;
    bool findText(const QString &, QFlags<QWebPage::FindFlag> options = 0);
    virtual bool event(QEvent *);

public slots:
    void stop();
    void back();
    void forward();
    void reload();
%If (PyQt_Printer)
    void print(QPrinter *) const /PyName=print_/;
%End
%If (Py_v3 || PyQt_Printer)
    void print(QPrinter *printer) const;
%End

signals:
    void loadStarted();
    void loadProgress(int);
    void loadFinished(bool);
    void titleChanged(const QString &);
    void statusBarMessage(const QString &);
    void linkClicked(const QUrl &);
    void selectionChanged();
    void iconChanged();
    void urlChanged(const QUrl &);

protected:
    virtual QWebView *createWindow(QWebPage::WebWindowType);
    virtual void resizeEvent(QResizeEvent *);
    virtual void paintEvent(QPaintEvent *);
    virtual void changeEvent(QEvent *);
    virtual void mouseMoveEvent(QMouseEvent *);
    virtual void mousePressEvent(QMouseEvent *);
    virtual void mouseDoubleClickEvent(QMouseEvent *);
    virtual void mouseReleaseEvent(QMouseEvent *);
    virtual void contextMenuEvent(QContextMenuEvent *);
    virtual void wheelEvent(QWheelEvent *);
    virtual void keyPressEvent(QKeyEvent *);
    virtual void keyReleaseEvent(QKeyEvent *);
    virtual void dragEnterEvent(QDragEnterEvent *);
    virtual void dragLeaveEvent(QDragLeaveEvent *);
    virtual void dragMoveEvent(QDragMoveEvent *);
    virtual void dropEvent(QDropEvent *);
    virtual void focusInEvent(QFocusEvent *);
    virtual void focusOutEvent(QFocusEvent *);
    virtual void inputMethodEvent(QInputMethodEvent *);
    virtual bool focusNextPrevChild(bool);

public:
%If (Qt_4_5_0 -)
    qreal zoomFactor() const;
%End
%If (Qt_4_5_0 -)
    void setZoomFactor(qreal);
%End
%If (Qt_4_6_0 -)
    QFlags<QPainter::RenderHint> renderHints() const;
%End
%If (Qt_4_6_0 -)
    void setRenderHints(QFlags<QPainter::RenderHint>);
%End
%If (Qt_4_6_0 -)
    void setRenderHint(QPainter::RenderHint, bool enabled = true);
%End
};

%End
