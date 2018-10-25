QT += quick
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

INCLUDEPATH += \
    "C:\usr\local\protobuf\2.6.1\include"

SOURCES += \
    src/main.cpp \
#    src/refereebox.cpp \
#    proto/cpp/referee.pb.cc \
#    proto/cpp/game_event.pb.cc
    src/refereebox.cpp \
    src/proto/cpp/game_event.pb.cc \
    src/proto/cpp/referee.pb.cc


RESOURCES += qml.qrc \
    qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

SUBDIRS += \
    try.pro

HEADERS += \
#    src/refereebox.h \
#    proto/cpp/referee.pb.h \
#    proto/cpp/game_event.pb.h
    src/refereebox.h \
    src/proto/cpp/game_event.pb.h \
    src/proto/cpp/referee.pb.h

win32 {
    PROTOBUF_INCLUDE_DIR = C:\usr\local\protobuf\2.6.1\include
    CONFIG(release,debug|release){
        LIBPROTOBUF = C:\usr\local\protobuf\2.6.1\lib\vs14.0\libprotobuf.lib
    }
    CONFIG(debug,debug|release){
        LIBPROTOBUF = C:\usr\local\protobuf\2.6.1\lib\vs14.0\libprotobufD.lib
    }
}

INCLUDEPATH += \
    $$PWD/src/proto/cpp \
    ../src

LIBS += $$LIBPROTOBUF
INCLUDEPATH += $$PROTOBUF_INCLUDE_DIR

DISTFILES +=
