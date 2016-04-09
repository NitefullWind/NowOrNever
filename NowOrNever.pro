TEMPLATE = app

QT += qml quick sql network
CONFIG += c++11
SOURCES += src/core/main.cpp \
    src/ui/fontUtil.cpp \
    src/core/dicDB.cpp \
    src/core/word.cpp \
    src/core/dbOp.cpp \
    src/core/network.cpp \
    src/core/userLogin.cpp \
    src/core/userSignup.cpp \
    src/core/user.cpp \
    src/core/download/ftpOp.cpp \
    src/core/download/qftp.cpp \
    src/core/download/qurlinfo.cpp

RESOURCES += qml.qrc \
    images.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

HEADERS += \
    src/ui/fontUtil.h \
    src/core/dicDB.h \
    src/core/word.h \
    src/core/dbOp.h \
    src/core/network.h \
    src/core/userLogin.h \
    src/core/userSignup.h \
    src/core/user.h \
    src/core/download/ftpOp.h \
    src/core/download/qftp.h \
    src/core/download/qurlinfo.h
