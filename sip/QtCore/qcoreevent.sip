// qcoreevent.sip generated by MetaSIP on Fri Oct 29 15:43:58 2010
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


class QEvent /Supertype=sip.wrapper/
{
%TypeHeaderCode
#include <qcoreevent.h>
%End

%ConvertToSubClassCode
    switch (sipCpp->type())
    {
    case QEvent::Timer:
            sipType = sipType_QTimerEvent;
            break;
    
    case QEvent::ChildAdded:
    case QEvent::ChildPolished:
    case QEvent::ChildRemoved:
            sipType = sipType_QChildEvent;
            break;
    
    #if QT_VERSION >= 0x040200
    case QEvent::DynamicPropertyChange:
            sipType = sipType_QDynamicPropertyChangeEvent;
            break;
    #endif
    
    #if QT_VERSION >= 0x040600
    case QEvent::StateMachineSignal:
            sipType = sipType_QStateMachine_SignalEvent;
            break;
    
    case QEvent::StateMachineWrapped:
            sipType = sipType_QStateMachine_WrappedEvent;
            break;
    #endif
    
    default:
            sipType = 0;
    }
%End

public:
    enum Type
    {
        None,
        Timer,
        MouseButtonPress,
        MouseButtonRelease,
        MouseButtonDblClick,
        MouseMove,
        KeyPress,
        KeyRelease,
        FocusIn,
        FocusOut,
        Enter,
        Leave,
        Paint,
        Move,
        Resize,
        Show,
        Hide,
        Close,
        ParentChange,
        ParentAboutToChange,
        WindowActivate,
        WindowDeactivate,
        ShowToParent,
        HideToParent,
        Wheel,
        WindowTitleChange,
        WindowIconChange,
        ApplicationWindowIconChange,
        ApplicationFontChange,
        ApplicationLayoutDirectionChange,
        ApplicationPaletteChange,
        PaletteChange,
        Clipboard,
        MetaCall,
        SockAct,
        WinEventAct,
        DeferredDelete,
        DragEnter,
        DragMove,
        DragLeave,
        Drop,
        ChildAdded,
        ChildPolished,
        ChildRemoved,
        PolishRequest,
        Polish,
        LayoutRequest,
        UpdateRequest,
        UpdateLater,
        ContextMenu,
        InputMethod,
        AccessibilityPrepare,
        TabletMove,
        LocaleChange,
        LanguageChange,
        LayoutDirectionChange,
        TabletPress,
        TabletRelease,
        OkRequest,
        IconDrag,
        FontChange,
        EnabledChange,
        ActivationChange,
        StyleChange,
        IconTextChange,
        ModifiedChange,
        MouseTrackingChange,
        WindowBlocked,
        WindowUnblocked,
        WindowStateChange,
        ToolTip,
        WhatsThis,
        StatusTip,
        ActionChanged,
        ActionAdded,
        ActionRemoved,
        FileOpen,
        Shortcut,
        ShortcutOverride,
        WhatsThisClicked,
        ToolBarChange,
%If (Qt_4_3_0 -)
        ApplicationActivate,
%End
        ApplicationActivated,
%If (Qt_4_3_0 -)
        ApplicationDeactivate,
%End
        ApplicationDeactivated,
        QueryWhatsThis,
        EnterWhatsThisMode,
        LeaveWhatsThisMode,
        ZOrderChange,
        HoverEnter,
        HoverLeave,
        HoverMove,
        AccessibilityHelp,
        AccessibilityDescription,
        MenubarUpdated,
%If (Qt_4_2_0 -)
        GraphicsSceneMouseMove,
%End
%If (Qt_4_2_0 -)
        GraphicsSceneMousePress,
%End
%If (Qt_4_2_0 -)
        GraphicsSceneMouseRelease,
%End
%If (Qt_4_2_0 -)
        GraphicsSceneMouseDoubleClick,
%End
%If (Qt_4_2_0 -)
        GraphicsSceneContextMenu,
%End
%If (Qt_4_2_0 -)
        GraphicsSceneHoverEnter,
%End
%If (Qt_4_2_0 -)
        GraphicsSceneHoverMove,
%End
%If (Qt_4_2_0 -)
        GraphicsSceneHoverLeave,
%End
%If (Qt_4_2_0 -)
        GraphicsSceneHelp,
%End
%If (Qt_4_2_0 -)
        GraphicsSceneDragEnter,
%End
%If (Qt_4_2_0 -)
        GraphicsSceneDragMove,
%End
%If (Qt_4_2_0 -)
        GraphicsSceneDragLeave,
%End
%If (Qt_4_2_0 -)
        GraphicsSceneDrop,
%End
%If (Qt_4_2_0 -)
        GraphicsSceneWheel,
%End
%If (Qt_4_4_0 -)
        GraphicsSceneResize,
%End
%If (Qt_4_4_0 -)
        GraphicsSceneMove,
%End
%If (Qt_4_2_0 -)
        KeyboardLayoutChange,
%End
%If (Qt_4_2_0 -)
        DynamicPropertyChange,
%End
%If (Qt_4_2_0 -)
        TabletEnterProximity,
%End
%If (Qt_4_2_0 -)
        TabletLeaveProximity,
%End
%If (Qt_4_4_0 -)
        CursorChange,
%End
%If (Qt_4_4_0 -)
        ToolTipChange,
%End
%If (Qt_4_4_0 -)
        GrabMouse,
%End
%If (Qt_4_4_0 -)
        UngrabMouse,
%End
%If (Qt_4_4_0 -)
        GrabKeyboard,
%End
%If (Qt_4_4_0 -)
        UngrabKeyboard,
%End
%If (Qt_4_6_0 -)
        StateMachineSignal,
%End
%If (Qt_4_6_0 -)
        StateMachineWrapped,
%End
%If (Qt_4_6_0 -)
        TouchBegin,
%End
%If (Qt_4_6_0 -)
        TouchUpdate,
%End
%If (Qt_4_6_0 -)
        TouchEnd,
%End
%If (Qt_4_6_0 -)
        RequestSoftwareInputPanel,
%End
%If (Qt_4_6_0 -)
        CloseSoftwareInputPanel,
%End
%If (Qt_4_6_0 -)
        WinIdChange,
%End
%If (Qt_4_6_0 -)
        Gesture,
%End
%If (Qt_4_6_0 -)
        GestureOverride,
%End
        User,
        MaxUser,
    };

    QEvent(QEvent::Type);
    virtual ~QEvent();
    QEvent::Type type() const;
    bool spontaneous() const;
    void setAccepted(bool);
    bool isAccepted() const;
    void accept();
    void ignore();
%If (Qt_4_4_0 -)
    static int registerEventType(int hint = -1);
%End
};

class QTimerEvent : QEvent
{
%TypeHeaderCode
#include <qcoreevent.h>
%End

public:
    QTimerEvent(int);
    virtual ~QTimerEvent();
    int timerId() const;
};

class QChildEvent : QEvent
{
%TypeHeaderCode
#include <qcoreevent.h>
%End

public:
    QChildEvent(QEvent::Type, QObject *);
    virtual ~QChildEvent();
    QObject *child() const;
    bool added() const;
    bool polished() const;
    bool removed() const;
};

%If (Qt_4_2_0 -)

class QDynamicPropertyChangeEvent : QEvent
{
%TypeHeaderCode
#include <qcoreevent.h>
%End

public:
    QDynamicPropertyChangeEvent(const QByteArray &);
    virtual ~QDynamicPropertyChangeEvent();
    QByteArray propertyName() const;
};

%End
