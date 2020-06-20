QT += quick
QT += qml quick widgets
QT += quickcontrols2


CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        defs.cpp \
        first_stage.cpp \
        main.cpp \
        second_stage.cpp \
        second_stage_activity_model.cpp \
        summary.cpp \
        third_stage.cpp \
        third_stage_product_model.cpp

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
    defs.h \
    first_stage.h \
    second_stage.h \
    second_stage_activity_model.h \
    summary.h \
    third_stage.h \
    third_stage_product_model.h

DISTFILES +=

android
{
my_files.path = /assets
my_files.files += $$PWD/assets/tablitsa.csv
my_files.files += $$PWD/assets/tablitsa_produktov_itog.csv

INSTALLS += my_files

}
