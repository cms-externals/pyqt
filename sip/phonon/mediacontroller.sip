// mediacontroller.sip generated by MetaSIP on Fri Oct 29 15:43:58 2010
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
%ModuleCode
#include <mediacontroller.h>
%End
%End

%If (Qt_4_4_0 -)

namespace Phonon
{
%TypeHeaderCode
#include <mediacontroller.h>
%End

    class MediaController : QObject
    {
%TypeHeaderCode
#include <mediacontroller.h>
%End

    public:
        enum Feature
        {
            Angles,
            Chapters,
            Titles,
        };

        typedef QFlags<Phonon::MediaController::Feature> Features;
        MediaController(Phonon::MediaObject * /TransferThis/);
        virtual ~MediaController();
        QFlags<Phonon::MediaController::Feature> supportedFeatures() const;
        int availableAngles() const;
        int currentAngle() const;
        int availableChapters() const;
        int currentChapter() const;
        int availableTitles() const;
        int currentTitle() const;
        bool autoplayTitles() const;

    public slots:
        void setCurrentAngle(int);
        void setCurrentChapter(int);
        void setCurrentTitle(int);
        void setAutoplayTitles(bool);
        void nextTitle();
        void previousTitle();

    signals:
        void availableAnglesChanged(int);
        void angleChanged(int);
        void availableChaptersChanged(int);
        void chapterChanged(int);
        void availableTitlesChanged(int);
        void titleChanged(int);

    public:
%If (Qt_4_5_0 -)
        Phonon::AudioChannelDescription currentAudioChannel() const;
%End
%If (Qt_4_5_0 -)
        Phonon::SubtitleDescription currentSubtitle() const;
%End
%If (Qt_4_5_0 -)
        QList<Phonon::AudioChannelDescription> availableAudioChannels() const;
%End
%If (Qt_4_5_0 -)
        QList<Phonon::SubtitleDescription> availableSubtitles() const;
%End
%If (Qt_4_5_0 -)
        void setCurrentAudioChannel(const Phonon::AudioChannelDescription &);
%End
%If (Qt_4_5_0 -)
        void setCurrentSubtitle(const Phonon::SubtitleDescription &);
%End

    signals:
%If (Qt_4_5_0 -)
        void availableSubtitlesChanged();
%End
%If (Qt_4_5_0 -)
        void availableAudioChannelsChanged();
%End
    };
};

%End
%If (Qt_4_4_0 -)
QFlags<Phonon::MediaController::Feature> operator|(Phonon::MediaController::Feature, QFlags<Phonon::MediaController::Feature>);
%End
