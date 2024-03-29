// objectdescription.sip generated by MetaSIP on Fri Oct 29 15:43:58 2010
//
// This file is part of the phonon Python extension module.
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

namespace Phonon
{
%TypeHeaderCode
#include <objectdescription.h>
%End

// The ObjectDescription template and implementations.
// ObjectDescription is a template but has a limited, and well defined, set of
// concrete implementations with appropriate typedefs.

template<type>
class ObjectDescription
{
%TypeHeaderCode
#include <objectdescription.h>
%End

public:
    ObjectDescription();
    ObjectDescription(int index, const QHash<QByteArray, QVariant>& properties);

    QString description() const;
    int index() const;
    bool isValid() const;
    QString name() const;
    QVariant property(const char *name) const;
    QList<QByteArray> propertyNames() const;

    bool operator!=(const ObjectDescription& otherDescription) const;
    bool operator==(const ObjectDescription& otherDescription) const;

    static ObjectDescription fromIndex(int index);
};

typedef Phonon::ObjectDescription<Phonon::AudioOutputDeviceType> AudioOutputDevice;
typedef Phonon::ObjectDescription<Phonon::EffectType> EffectDescription;
%If (Qt_4_5_0 -)
typedef Phonon::ObjectDescription<Phonon::SubtitleType> SubtitleDescription;
typedef Phonon::ObjectDescription<Phonon::AudioChannelType> AudioChannelDescription;
typedef Phonon::ObjectDescription<Phonon::AudioCaptureDeviceType> AudioCaptureDevice;
%End
// The ObjectDescriptionModel template and implementations.
// ObjectDescriptionModel is a template but has a limited, and well defined,
// set of concrete implementations with appropriate typedefs.
//
// Note that this isn't in objectdescriptionmodel.sip as might be expected
// because the .h file can't be parsed with the version of GCC-XML that metasip
// uses.

template<type>
class ObjectDescriptionModel : QAbstractListModel
{
%TypeHeaderCode
#include <objectdescriptionmodel.h>
%End

public:
    ObjectDescriptionModel(QObject *parent /TransferThis/ = 0);
    ObjectDescriptionModel(const QList<Phonon::ObjectDescription<type> > &data, QObject *parent /TransferThis/ = 0);

    QList<int> tupleIndexOrder() const;
    int tupleIndexAtPositionIndex(int positionIndex) const;
    void moveUp(const QModelIndex &index);
    void moveDown(const QModelIndex &index);
    void setModelData(const QList<Phonon::ObjectDescription<type> > &data);
    QList<Phonon::ObjectDescription<type> > modelData() const;
    Phonon::ObjectDescription<type> modelData(const QModelIndex &index) const;

    // Reimplementations.
    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    Qt::ItemFlags flags(const QModelIndex &index) const;
    QMimeData *mimeData(const QModelIndexList &indexes) const;
    Qt::DropActions supportedDropActions() const;
    bool dropMimeData(const QMimeData *data, Qt::DropAction action, int row, int column, const QModelIndex &parent);
    bool removeRows(int row, int count, const QModelIndex &parent = QModelIndex());
    QStringList mimeTypes() const;
};

typedef Phonon::ObjectDescriptionModel<Phonon::AudioOutputDeviceType> AudioOutputDeviceModel;
typedef Phonon::ObjectDescriptionModel<Phonon::EffectType> EffectDescriptionModel;
};

%End
