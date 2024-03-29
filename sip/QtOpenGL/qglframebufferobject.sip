// qglframebufferobject.sip generated by MetaSIP on Fri Oct 29 15:43:58 2010
//
// This file is part of the QtOpenGL Python extension module.
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


%If (Qt_4_2_0 -)

class QGLFramebufferObject : QPaintDevice
{
%TypeHeaderCode
#include <qglframebufferobject.h>
%End

public:
%If (Qt_4_3_0 -)

    enum Attachment
    {
        NoAttachment,
        CombinedDepthStencil,
        Depth,
    };

%End
    QGLFramebufferObject(const QSize &, GLenum target = GL_TEXTURE_2D);
    QGLFramebufferObject(int, int, GLenum target = GL_TEXTURE_2D);
%If (Qt_4_3_0 -)
%If (PyQt_NoOpenGLES)
    QGLFramebufferObject(const QSize &, QGLFramebufferObject::Attachment, GLenum target = GL_TEXTURE_2D, GLenum internalFormat = GL_RGBA8);
%End
%End
%If (Qt_4_3_0 -)
%If (PyQt_NoOpenGLES)
    QGLFramebufferObject(int, int, QGLFramebufferObject::Attachment, GLenum target = GL_TEXTURE_2D, GLenum internalFormat = GL_RGBA8);
%End
%End
%If (Qt_4_6_0 -)
%If (!PyQt_NoOpenGLES)
// Alternative ctors if OpenGL ES is used.
QGLFramebufferObject(const QSize &, QGLFramebufferObject::Attachment, GLenum target = GL_TEXTURE_2D, GLenum internalFormat = GL_RGBA);
QGLFramebufferObject(int, int, QGLFramebufferObject::Attachment, GLenum target = GL_TEXTURE_2D, GLenum internalFormat = GL_RGBA);
%End
%End
%If (Qt_4_6_0 -)
    QGLFramebufferObject(const QSize &, const QGLFramebufferObjectFormat &);
%End
%If (Qt_4_6_0 -)
    QGLFramebufferObject(int, int, const QGLFramebufferObjectFormat &);
%End
    virtual ~QGLFramebufferObject();
%If (Qt_4_3_0 -)
    QGLFramebufferObject::Attachment attachment() const;
%End
    bool isValid() const;
    bool bind();
%If (Qt_4_5_0 -)
    bool isBound() const;
%End
    bool release();
    GLuint texture() const;
%If (Qt_4_4_0 -)
    void drawTexture(const QRectF &, GLuint, GLenum textureTarget = GL_TEXTURE_2D);
%End
%If (Qt_4_4_0 -)
    void drawTexture(const QPointF &, GLuint, GLenum textureTarget = GL_TEXTURE_2D);
%End
    QSize size() const;
    QImage toImage() const;
    virtual QPaintEngine *paintEngine() const;
    GLuint handle() const;
    static bool hasOpenGLFramebufferObjects();

protected:
    virtual int metric(QPaintDevice::PaintDeviceMetric) const;

public:
%If (Qt_4_6_0 -)
    QGLFramebufferObjectFormat format() const;
%End
%If (Qt_4_6_0 -)
    static bool hasOpenGLFramebufferBlit();
%End
%If (Qt_4_6_0 -)
    static void blitFramebuffer(QGLFramebufferObject *, const QRect &, QGLFramebufferObject *, const QRect &, GLbitfield buffers = GL_COLOR_BUFFER_BIT, GLenum filter = GL_NEAREST);
%End

private:
    QGLFramebufferObject(const QGLFramebufferObject &);
};

%End
%If (Qt_4_6_0 -)

class QGLFramebufferObjectFormat
{
%TypeHeaderCode
#include <qglframebufferobject.h>
%End

public:
    QGLFramebufferObjectFormat();
    QGLFramebufferObjectFormat(const QGLFramebufferObjectFormat &);
    ~QGLFramebufferObjectFormat();
    void setSamples(int);
    int samples() const;
    void setAttachment(QGLFramebufferObject::Attachment);
    QGLFramebufferObject::Attachment attachment() const;
    void setTextureTarget(GLenum);
    GLenum textureTarget() const;
    void setInternalTextureFormat(GLenum);
    GLenum internalTextureFormat() const;
    bool operator==(const QGLFramebufferObjectFormat &) const;
    bool operator!=(const QGLFramebufferObjectFormat &) const;
};

%End
