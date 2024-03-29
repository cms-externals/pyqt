// qlineedit.sip generated by MetaSIP on Fri Oct 29 15:43:58 2010
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


class QLineEdit : QWidget
{
%TypeHeaderCode
#include <qlineedit.h>
%End

public:
    explicit QLineEdit(QWidget *parent /TransferThis/ = 0);
    QLineEdit(const QString &, QWidget *parent /TransferThis/ = 0);
    virtual ~QLineEdit();
    QString text() const;
    QString displayText() const;
    int maxLength() const;
    void setMaxLength(int);
    void setFrame(bool);
    bool hasFrame() const;

    enum EchoMode
    {
        Normal,
        NoEcho,
        Password,
%If (Qt_4_2_0 -)
        PasswordEchoOnEdit,
%End
    };

    QLineEdit::EchoMode echoMode() const;
    void setEchoMode(QLineEdit::EchoMode);
    bool isReadOnly() const;
    void setReadOnly(bool);
    void setValidator(const QValidator * /KeepReference/);
    const QValidator *validator() const;
    virtual QSize sizeHint() const;
    virtual QSize minimumSizeHint() const;
    int cursorPosition() const;
    void setCursorPosition(int);
    int cursorPositionAt(const QPoint &);
    void setAlignment(Qt::Alignment);
    Qt::Alignment alignment() const;
    void cursorForward(bool, int steps = 1);
    void cursorBackward(bool, int steps = 1);
    void cursorWordForward(bool);
    void cursorWordBackward(bool);
    void backspace();
    void del() /PyName=del_/;
    void home(bool);
    void end(bool);
    bool isModified() const;
    void setModified(bool);
    void setSelection(int, int);
    bool hasSelectedText() const;
    QString selectedText() const;
    int selectionStart() const;
    bool isUndoAvailable() const;
    bool isRedoAvailable() const;
    void setDragEnabled(bool);
    bool dragEnabled() const;
    QString inputMask() const;
    void setInputMask(const QString &);
    bool hasAcceptableInput() const;
    void setText(const QString &);
    void clear();
    void selectAll();
    void undo();
    void redo();
    void cut();
    void copy() const;
    void paste();
    void deselect();
    void insert(const QString &);
    QMenu *createStandardContextMenu() /Factory/;

signals:
    void textChanged(const QString &);
    void textEdited(const QString &);
    void cursorPositionChanged(int, int);
    void returnPressed();
    void editingFinished();
    void selectionChanged();

protected:
%If (Qt_4_3_0 -)
    void initStyleOption(QStyleOptionFrame *) const;
%End
    virtual void mousePressEvent(QMouseEvent *);
    virtual void mouseMoveEvent(QMouseEvent *);
    virtual void mouseReleaseEvent(QMouseEvent *);
    virtual void mouseDoubleClickEvent(QMouseEvent *);
    virtual void keyPressEvent(QKeyEvent *);
    virtual void focusInEvent(QFocusEvent *);
    virtual void focusOutEvent(QFocusEvent *);
    virtual void paintEvent(QPaintEvent *);
    virtual void dragEnterEvent(QDragEnterEvent *);
    virtual void dragMoveEvent(QDragMoveEvent *);
    virtual void dragLeaveEvent(QDragLeaveEvent *);
    virtual void dropEvent(QDropEvent *);
    virtual void changeEvent(QEvent *);
    virtual void contextMenuEvent(QContextMenuEvent *);
    virtual void inputMethodEvent(QInputMethodEvent *);
%If (Qt_4_4_0 -)
    QRect cursorRect() const;
%End

public:
    virtual QVariant inputMethodQuery(Qt::InputMethodQuery) const;
    virtual bool event(QEvent *);
%If (Qt_4_2_0 -)
    void setCompleter(QCompleter * /KeepReference/);
%End
%If (Qt_4_2_0 -)
    QCompleter *completer() const;
%End
%If (Qt_4_5_0 -)
    void setTextMargins(int, int, int, int);
%End
%If (Qt_4_5_0 -)
    void getTextMargins(int *, int *, int *, int *) const;
%End
%If (Qt_4_6_0 -)
    void setTextMargins(const QMargins &);
%End
%If (Qt_4_6_0 -)
    QMargins textMargins() const;
%End
%If (Qt_4_7_0 -)
    QString placeholderText() const;
%End
%If (Qt_4_7_0 -)
    void setPlaceholderText(const QString &);
%End

private:
    QLineEdit(const QLineEdit &);
};
