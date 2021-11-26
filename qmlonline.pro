TARGET = qmlonline

CONFIG += \
    c++14 \
    file_copies \

QT += \
    gui \
    network \
    opengl \
    qml \
    quick \
    quickwidgets \
    svg \
    widgets \
    xml

SOURCES += \
    src/main.cpp \
    src/util.cpp \
    src/version.cpp \

HEADERS += \
    src/util.h \
    src/version.h \

RESOURCES += \
    resources.qrc

html.files = $$PWD/html/*
html.path = $$OUT_PWD

examples.files = $$PWD/qml
examples.path = $$OUT_PWD

COPIES += html examples

OBJECTS_DIR = $$$$OUT_PWD/objects
MOC_DIR = $$$$OUT_PWD/moc

# Get actual build information
GIT_VERSION = $$system(git --git-dir $$_PRO_FILE_PWD_/.git --work-tree $$PWD log -1 --format=%h)
GIT_VERSION_DATE = $$system(git --git-dir $$_PRO_FILE_PWD_/.git --work-tree $$PWD log -1 --pretty='format:%cd' --date=format:'%d/%m/%Y')
GIT_URL = $$system(git --git-dir $$_PRO_FILE_PWD_/.git --work-tree $$PWD remote get-url origin)
DEFINES += 'GIT_VERSION=\\"$$GIT_VERSION\\"'
DEFINES += 'GIT_VERSION_DATE=\\"$$GIT_VERSION_DATE\\"'
DEFINES += 'GIT_URL=\\"$$GIT_URL\\"'

message(" GIT_VERSION:      " $$GIT_VERSION)
message(" GIT_VERSION_DATE: " $$GIT_VERSION_DATE)
message(" GIT_URL:          " $$GIT_URL)
