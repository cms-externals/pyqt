// qtextformat.sip generated by MetaSIP on Fri Oct 29 15:43:58 2010
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
#include <qtextformat.h>
%End

class QTextLength
{
%TypeHeaderCode
#include <qtextformat.h>
%End

public:
    enum Type
    {
        VariableLength,
        FixedLength,
        PercentageLength,
    };

    QTextLength();
    QTextLength::Type type() const;
    QTextLength(QTextLength::Type, qreal);
    qreal value(qreal) const;
    qreal rawValue() const;
    bool operator==(const QTextLength &) const;
    bool operator!=(const QTextLength &) const;
    QTextLength(const QVariant &variant) /NoDerived/;
%MethodCode
        sipCpp = new QTextLength(qVariantValue<QTextLength>(*a0));
%End
};

QDataStream &operator<<(QDataStream &, const QTextLength & /Constrained/);
QDataStream &operator>>(QDataStream &, QTextLength & /Constrained/);

class QTextFormat
{
%TypeHeaderCode
#include <qtextformat.h>
%End

public:
    enum FormatType
    {
        InvalidFormat,
        BlockFormat,
        CharFormat,
        ListFormat,
        TableFormat,
        FrameFormat,
        UserFormat,
    };

    enum ObjectTypes
    {
        NoObject,
        ImageObject,
        TableObject,
%If (Qt_4_4_0 -)
        TableCellObject,
%End
        UserObject,
    };

%If (Qt_4_2_0 -)

    enum PageBreakFlag
    {
        PageBreak_Auto,
        PageBreak_AlwaysBefore,
        PageBreak_AlwaysAfter,
    };

%End
%If (Qt_4_2_0 -)
    typedef QFlags<QTextFormat::PageBreakFlag> PageBreakFlags;
%End

    enum Property
    {
        ObjectIndex,
        CssFloat,
        LayoutDirection,
        OutlinePen,
        BackgroundBrush,
        ForegroundBrush,
        BlockAlignment,
        BlockTopMargin,
        BlockBottomMargin,
        BlockLeftMargin,
        BlockRightMargin,
        TextIndent,
        BlockIndent,
        BlockNonBreakableLines,
        BlockTrailingHorizontalRulerWidth,
        FontFamily,
        FontPointSize,
        FontSizeAdjustment,
        FontSizeIncrement,
        FontWeight,
        FontItalic,
        FontUnderline,
        FontOverline,
        FontStrikeOut,
        FontFixedPitch,
        FontPixelSize,
        TextUnderlineColor,
        TextVerticalAlignment,
        TextOutline,
        IsAnchor,
        AnchorHref,
        AnchorName,
        ObjectType,
        ListStyle,
        ListIndent,
        FrameBorder,
        FrameMargin,
        FramePadding,
        FrameWidth,
        FrameHeight,
        TableColumns,
        TableColumnWidthConstraints,
        TableCellSpacing,
        TableCellPadding,
        TableCellRowSpan,
        TableCellColumnSpan,
        ImageName,
        ImageWidth,
        ImageHeight,
%If (Qt_4_2_0 -)
        TextUnderlineStyle,
%End
%If (Qt_4_2_0 -)
        TableHeaderRowCount,
%End
%If (Qt_4_2_0 -)
        FullWidthSelection,
%End
%If (Qt_4_2_0 -)
        PageBreakPolicy,
%End
%If (Qt_4_3_0 -)
        TextToolTip,
%End
%If (Qt_4_3_0 -)
        FrameTopMargin,
%End
%If (Qt_4_3_0 -)
        FrameBottomMargin,
%End
%If (Qt_4_3_0 -)
        FrameLeftMargin,
%End
%If (Qt_4_3_0 -)
        FrameRightMargin,
%End
%If (Qt_4_3_0 -)
        FrameBorderBrush,
%End
%If (Qt_4_3_0 -)
        FrameBorderStyle,
%End
%If (Qt_4_4_0 -)
        BackgroundImageUrl,
%End
%If (Qt_4_4_0 -)
        TabPositions,
%End
%If (Qt_4_4_0 -)
        FirstFontProperty,
%End
%If (Qt_4_4_0 -)
        FontCapitalization,
%End
%If (Qt_4_4_0 -)
        FontLetterSpacing,
%End
%If (Qt_4_4_0 -)
        FontWordSpacing,
%End
%If (Qt_4_4_0 -)
        LastFontProperty,
%End
%If (Qt_4_4_0 -)
        TableCellTopPadding,
%End
%If (Qt_4_4_0 -)
        TableCellBottomPadding,
%End
%If (Qt_4_4_0 -)
        TableCellLeftPadding,
%End
%If (Qt_4_4_0 -)
        TableCellRightPadding,
%End
%If (Qt_4_5_0 -)
        FontStyleHint,
%End
%If (Qt_4_5_0 -)
        FontStyleStrategy,
%End
%If (Qt_4_5_0 -)
        FontKerning,
%End
        UserProperty,
    };

    QTextFormat();
    explicit QTextFormat(int);
    QTextFormat(const QTextFormat &);
    ~QTextFormat();
    void merge(const QTextFormat &);
    bool isValid() const;
    int type() const;
    int objectIndex() const;
    void setObjectIndex(int);
    QVariant property(int) const;
    void setProperty(int, const QVariant &);
    void clearProperty(int);
    bool hasProperty(int) const;
    bool boolProperty(int) const;
    int intProperty(int) const;
    qreal doubleProperty(int) const;
    QString stringProperty(int) const;
    QColor colorProperty(int) const;
    QPen penProperty(int) const;
    QBrush brushProperty(int) const;
    QTextLength lengthProperty(int) const;
    QVector<QTextLength> lengthVectorProperty(int) const;
    void setProperty(int, const QVector<QTextLength> &);
    QMap<int,QVariant> properties() const;
    int objectType() const;
    bool isCharFormat() const;
    bool isBlockFormat() const;
    bool isListFormat() const;
    bool isFrameFormat() const;
    bool isImageFormat() const;
    bool isTableFormat() const;
    QTextBlockFormat toBlockFormat() const;
    QTextCharFormat toCharFormat() const;
    QTextListFormat toListFormat() const;
    QTextTableFormat toTableFormat() const;
    QTextFrameFormat toFrameFormat() const;
    QTextImageFormat toImageFormat() const;
    bool operator==(const QTextFormat &) const;
    bool operator!=(const QTextFormat &) const;
    QTextFormat(const QVariant &variant) /NoDerived/;
%MethodCode
        sipCpp = new QTextFormat(qVariantValue<QTextFormat>(*a0));
%End

    void setLayoutDirection(Qt::LayoutDirection);
    Qt::LayoutDirection layoutDirection() const;
    void setBackground(const QBrush &);
    QBrush background() const;
    void clearBackground();
    void setForeground(const QBrush &);
    QBrush foreground() const;
    void clearForeground();
    void setObjectType(int);
%If (Qt_4_3_0 -)
    int propertyCount() const;
%End
%If (Qt_4_4_0 -)
    bool isTableCellFormat() const;
%End
%If (Qt_4_4_0 -)
    QTextTableCellFormat toTableCellFormat() const;
%End
};

QDataStream &operator<<(QDataStream &, const QTextFormat & /Constrained/);
QDataStream &operator>>(QDataStream &, QTextFormat & /Constrained/);

class QTextCharFormat : QTextFormat
{
%TypeHeaderCode
#include <qtextformat.h>
%End

public:
    enum VerticalAlignment
    {
        AlignNormal,
        AlignSuperScript,
        AlignSubScript,
%If (Qt_4_3_0 -)
        AlignMiddle,
%End
%If (Qt_4_3_0 -)
        AlignTop,
%End
%If (Qt_4_3_0 -)
        AlignBottom,
%End
    };

    QTextCharFormat();
    bool isValid() const;
    void setFont(const QFont &);
    QFont font() const;
    void setFontFamily(const QString &);
    QString fontFamily() const;
    void setFontPointSize(qreal);
    qreal fontPointSize() const;
    void setFontWeight(int);
    int fontWeight() const;
    void setFontItalic(bool);
    bool fontItalic() const;
    void setFontUnderline(bool);
    bool fontUnderline() const;
    void setFontOverline(bool);
    bool fontOverline() const;
    void setFontStrikeOut(bool);
    bool fontStrikeOut() const;
    void setUnderlineColor(const QColor &);
    QColor underlineColor() const;
    void setFontFixedPitch(bool);
    bool fontFixedPitch() const;
    void setVerticalAlignment(QTextCharFormat::VerticalAlignment);
    QTextCharFormat::VerticalAlignment verticalAlignment() const;
    void setAnchor(bool);
    bool isAnchor() const;
    void setAnchorHref(const QString &);
    QString anchorHref() const;
    void setAnchorName(const QString &);
    QString anchorName() const;
    int tableCellRowSpan() const;
    int tableCellColumnSpan() const;
    void setTableCellRowSpan(int);
    void setTableCellColumnSpan(int);
    void setTextOutline(const QPen &);
    QPen textOutline() const;
%If (Qt_4_2_0 -)

    enum UnderlineStyle
    {
        NoUnderline,
        SingleUnderline,
        DashUnderline,
        DotLine,
        DashDotLine,
        DashDotDotLine,
        WaveUnderline,
        SpellCheckUnderline,
    };

%End
%If (Qt_4_2_0 -)
    void setUnderlineStyle(QTextCharFormat::UnderlineStyle);
%End
%If (Qt_4_2_0 -)
    QTextCharFormat::UnderlineStyle underlineStyle() const;
%End
%If (Qt_4_3_0 -)
    void setToolTip(const QString &);
%End
%If (Qt_4_3_0 -)
    QString toolTip() const;
%End
%If (Qt_4_3_0 -)
    void setAnchorNames(const QStringList &);
%End
%If (Qt_4_3_0 -)
    QStringList anchorNames() const;
%End
%If (Qt_4_4_0 -)
    void setFontCapitalization(QFont::Capitalization);
%End
%If (Qt_4_4_0 -)
    QFont::Capitalization fontCapitalization() const;
%End
%If (Qt_4_4_0 -)
    void setFontLetterSpacing(qreal);
%End
%If (Qt_4_4_0 -)
    qreal fontLetterSpacing() const;
%End
%If (Qt_4_4_0 -)
    void setFontWordSpacing(qreal);
%End
%If (Qt_4_4_0 -)
    qreal fontWordSpacing() const;
%End
%If (Qt_4_5_0 -)
    void setFontStyleHint(QFont::StyleHint, QFont::StyleStrategy strategy = QFont::PreferDefault);
%End
%If (Qt_4_5_0 -)
    void setFontStyleStrategy(QFont::StyleStrategy);
%End
%If (Qt_4_5_0 -)
    QFont::StyleHint fontStyleHint() const;
%End
%If (Qt_4_5_0 -)
    QFont::StyleStrategy fontStyleStrategy() const;
%End
%If (Qt_4_5_0 -)
    void setFontKerning(bool);
%End
%If (Qt_4_5_0 -)
    bool fontKerning() const;
%End
};

class QTextBlockFormat : QTextFormat
{
%TypeHeaderCode
#include <qtextformat.h>
%End

public:
    QTextBlockFormat();
    bool isValid() const;
    Qt::Alignment alignment() const;
    void setTopMargin(qreal);
    qreal topMargin() const;
    void setBottomMargin(qreal);
    qreal bottomMargin() const;
    void setLeftMargin(qreal);
    qreal leftMargin() const;
    void setRightMargin(qreal);
    qreal rightMargin() const;
    void setTextIndent(qreal);
    qreal textIndent() const;
    int indent() const;
    void setNonBreakableLines(bool);
    bool nonBreakableLines() const;
    void setAlignment(Qt::Alignment);
    void setIndent(int);
%If (Qt_4_2_0 -)
    void setPageBreakPolicy(QFlags<QTextFormat::PageBreakFlag>);
%End
%If (Qt_4_2_0 -)
    QFlags<QTextFormat::PageBreakFlag> pageBreakPolicy() const;
%End
%If (Qt_4_4_0 -)
    void setTabPositions(const QList<QTextOption::Tab> &);
%End
%If (Qt_4_4_0 -)
    QList<QTextOption::Tab> tabPositions() const;
%End
};

class QTextListFormat : QTextFormat
{
%TypeHeaderCode
#include <qtextformat.h>
%End

public:
    QTextListFormat();
    bool isValid() const;

    enum Style
    {
        ListDisc,
        ListCircle,
        ListSquare,
        ListDecimal,
        ListLowerAlpha,
        ListUpperAlpha,
%If (Qt_4_6_0 -)
        ListLowerRoman,
%End
%If (Qt_4_6_0 -)
        ListUpperRoman,
%End
    };

    QTextListFormat::Style style() const;
    int indent() const;
    void setStyle(QTextListFormat::Style);
    void setIndent(int);
};

class QTextImageFormat : QTextCharFormat
{
%TypeHeaderCode
#include <qtextformat.h>
%End

public:
    QTextImageFormat();
    bool isValid() const;
    QString name() const;
    qreal width() const;
    qreal height() const;
    void setName(const QString &);
    void setWidth(qreal);
    void setHeight(qreal);
};

class QTextFrameFormat : QTextFormat
{
%TypeHeaderCode
#include <qtextformat.h>
%End

public:
    QTextFrameFormat();
    bool isValid() const;

    enum Position
    {
        InFlow,
        FloatLeft,
        FloatRight,
    };

    void setPosition(QTextFrameFormat::Position);
    QTextFrameFormat::Position position() const;
    qreal border() const;
    qreal margin() const;
    qreal padding() const;
    void setWidth(const QTextLength &);
    QTextLength width() const;
    QTextLength height() const;
    void setBorder(qreal);
    void setMargin(qreal);
    void setPadding(qreal);
    void setWidth(qreal);
    void setHeight(qreal);
    void setHeight(const QTextLength &);
%If (Qt_4_2_0 -)
    void setPageBreakPolicy(QFlags<QTextFormat::PageBreakFlag>);
%End
%If (Qt_4_2_0 -)
    QFlags<QTextFormat::PageBreakFlag> pageBreakPolicy() const;
%End
%If (Qt_4_3_0 -)

    enum BorderStyle
    {
        BorderStyle_None,
        BorderStyle_Dotted,
        BorderStyle_Dashed,
        BorderStyle_Solid,
        BorderStyle_Double,
        BorderStyle_DotDash,
        BorderStyle_DotDotDash,
        BorderStyle_Groove,
        BorderStyle_Ridge,
        BorderStyle_Inset,
        BorderStyle_Outset,
    };

%End
%If (Qt_4_3_0 -)
    void setBorderBrush(const QBrush &);
%End
%If (Qt_4_3_0 -)
    QBrush borderBrush() const;
%End
%If (Qt_4_3_0 -)
    void setBorderStyle(QTextFrameFormat::BorderStyle);
%End
%If (Qt_4_3_0 -)
    QTextFrameFormat::BorderStyle borderStyle() const;
%End
%If (Qt_4_3_0 -)
    qreal topMargin() const;
%End
%If (Qt_4_3_0 -)
    qreal bottomMargin() const;
%End
%If (Qt_4_3_0 -)
    qreal leftMargin() const;
%End
%If (Qt_4_3_0 -)
    qreal rightMargin() const;
%End
%If (Qt_4_3_0 -)
    void setTopMargin(qreal);
%End
%If (Qt_4_3_0 -)
    void setBottomMargin(qreal);
%End
%If (Qt_4_3_0 -)
    void setLeftMargin(qreal);
%End
%If (Qt_4_3_0 -)
    void setRightMargin(qreal);
%End
};

class QTextTableFormat : QTextFrameFormat
{
%TypeHeaderCode
#include <qtextformat.h>
%End

public:
    QTextTableFormat();
    bool isValid() const;
    int columns() const;
    void setColumnWidthConstraints(const QVector<QTextLength> &);
    QVector<QTextLength> columnWidthConstraints() const;
    void clearColumnWidthConstraints();
    qreal cellSpacing() const;
    void setCellSpacing(qreal);
    qreal cellPadding() const;
    Qt::Alignment alignment() const;
    void setColumns(int);
    void setCellPadding(qreal);
    void setAlignment(Qt::Alignment);
%If (Qt_4_2_0 -)
    void setHeaderRowCount(int);
%End
%If (Qt_4_2_0 -)
    int headerRowCount() const;
%End
};

%If (Qt_4_2_0 -)
QFlags<QTextFormat::PageBreakFlag> operator|(QTextFormat::PageBreakFlag, QFlags<QTextFormat::PageBreakFlag>);
%End
%If (Qt_4_4_0 -)

class QTextTableCellFormat : QTextCharFormat
{
%TypeHeaderCode
#include <qtextformat.h>
%End

public:
    QTextTableCellFormat();
    bool isValid() const;
    void setTopPadding(qreal);
    qreal topPadding() const;
    void setBottomPadding(qreal);
    qreal bottomPadding() const;
    void setLeftPadding(qreal);
    qreal leftPadding() const;
    void setRightPadding(qreal);
    qreal rightPadding() const;
    void setPadding(qreal);
};

%End
