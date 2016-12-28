##
# This file is part of the libvcard project.
#
# Copyright (C) 2010, Emanuele Bertoldi (Card Tech srl).
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# $Revision$
# $Date$
##

QT       -= gui

TARGET = vcard
TEMPLATE = lib

include(version.pri)
DEFINES += LIBVCARD_LIBRARY
INCLUDEPATH += include


SOURCES += \
	src/vcard.cpp \
	src/vcardparam.cpp \
	src/vcardproperty.cpp \

HEADERS += \
	include/vcard.h \
	include/vcardparam.h \
	include/vcardproperty.h \
        include/libvcard_global.h

OTHER_FILES += version.pri

unix {
    target.path = $$[QT_INSTALL_LIBS]
    headers.path = $$[QT_INSTALL_HEADERS]/$$TARGET
    headers.files = $$HEADERS

    CONFIG += create_pc create_prl link_pkgconfig

    QMAKE_PKGCONFIG_DESTDIR = pkgconfig
    QMAKE_PKGCONFIG_INCDIR = $$headers.path

    pkgconfig.path = $$[QT_INSTALL_LIBS]/pkgconfig-qt5

    INSTALLS += target headers pkgconfig
}
