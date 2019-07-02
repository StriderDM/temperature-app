QT += quick
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        converter.cpp \
        main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    converter.h \
    temperature.h

android {

    equals(ANDROID_TARGET_ARCH,arm64-v8a)
    {
        LIBS += -L$$PWD/../../temperature-ffi/target/aarch64-linux-android/debug/ -ltemperature_ffi

        INCLUDEPATH += $$PWD/../../temperature-ffi/target/aarch64-linux-android/debug
        DEPENDPATH += $$PWD/../../temperature-ffi/target/aarch64-linux-android/debug

        ANDROID_EXTRA_LIBS = $$PWD/../../temperature-ffi/target/aarch64-linux-android/debug/libtemperature_ffi.so
    }

    equals(ANDROID_TARGET_ARCH,x86)
    {
        LIBS += -L$$PWD/../../temperature-ffi/target/i686-linux-android/debug/ -ltemperature_ffi

        INCLUDEPATH += $$PWD/../../temperature-ffi/target/i686-linux-android/debug
        DEPENDPATH += $$PWD/../../temperature-ffi/target/i686-linux-android/debug

        ANDROID_EXTRA_LIBS = $$PWD/../../temperature-ffi/target/i686-linux-android/debug/libtemperature_ffi.so
    }

    equals(ANDROID_TARGET_ARCH,x86_64)
    {
        LIBS += -L$$PWD/../../temperature-ffi/target/x86_64-linux-android/debug/ -ltemperature_ffi

        INCLUDEPATH += $$PWD/../../temperature-ffi/target/x86_64-linux-android/debug
        DEPENDPATH += $$PWD/../../temperature-ffi/target/x86_64-linux-android/debug

        ANDROID_EXTRA_LIBS = $$PWD/../../temperature-ffi/target/x86_64-linux-android/debug/libtemperature_ffi.so
    }

    equals(ANDROID_TARGET_ARCH,armeabi-v7a)
    {
        LIBS += -L$$PWD/../../temperature-ffi/target/armv7-linux-androideabi/debug/ -ltemperature_ffi

        INCLUDEPATH += $$PWD/../../temperature-ffi/target/armv7-linux-androideabi/debug
        DEPENDPATH += $$PWD/../../temperature-ffi/target/armv7-linux-androideabi/debug

        ANDROID_EXTRA_LIBS = $$PWD/../../temperature-ffi/target/armv7-linux-androideabi/debug/libtemperature_ffi.so
    }

}

ios {
    LIBS += -L$$PWD/../../temperature-ffi/target/x86_64-apple-ios/debug/ -ltemperature_ffi

    INCLUDEPATH += $$PWD/../../temperature-ffi/target/x86_64-apple-ios/debug
    DEPENDPATH += $$PWD/../../temperature-ffi/target/x86_64-apple-ios/debug
}

macx {
    LIBS += -L$$PWD/../../temperature-ffi/target/debug/ -ltemperature_ffi

    INCLUDEPATH += $$PWD/../../temperature-ffi/target/debug
    DEPENDPATH += $$PWD/../../temperature-ffi/target/debug
}

win32 {
    win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../temperature-ffi/target/x86_64-pc-windows-gnu/release/ -ltemperature_ffi
    else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../temperature-ffi/target/x86_64-pc-windows-gnu/debug/ -ltemperature_ffi

    INCLUDEPATH += $$PWD/../../temperature-ffi/target/x86_64-pc-windows-gnu/debug
    DEPENDPATH += $$PWD/../../temperature-ffi/target/x86_64-pc-windows-gnu/debug
}

linux {
    LIBS += -L$$PWD/../../temperature-ffi/target/x86_64-unknown-linux-musl/debug/ -ltemperature_ffi

    INCLUDEPATH += $$PWD/../../temperature-ffi/target/x86_64-unknown-linux-musl/debug
    DEPENDPATH += $$PWD/../../temperature-ffi/target/x86_64-unknown-linux-musl/debug

    PRE_TARGETDEPS += $$PWD/../../temperature-ffi/target/x86_64-unknown-linux-musl/debug/libtemperature_ffi.a
}


