#!/bin/bash

# Build pyside2 wheel

mkdir $WHEELHOUSE

PYSIDE2_VERSION=1.2.4

pip install wheel

#PySide2 dependencies from https://github.com/PySide/pyside2/wiki/Dependencies
sudo apt-add-repository ppa:ubuntu-sdk-team/ppa
sudo apt-get update
sudo apt-get install build-essential git cmake qt5-default libxml2 libxslt
sudo apt-get install qttools5-dev-tools libqt5clucene5 libqt5concurrent5 libqt5core5a libqt5dbus5 libqt5designer5 libqt5designercomponents5 libqt5feedback5 libqt5gui5 libqt5help5 libqt5multimedia5 libqt5network5 libqt5opengl5 libqt5opengl5-dev libqt5organizer5 libqt5positioning5 libqt5printsupport5 libqt5qml5 libqt5quick5 libqt5quickwidgets5 libqt5script5 libqt5scripttools5 libqt5sql5 libqt5sql5-sqlite libqt5svg5 libqt5test5 libqt5webkit5 libqt5widgets5 libqt5xml5 libqt5xmlpatterns5 libqt5xmlpatterns5-dev

# Download PySide2 Source
git clone --recursive https://github.com/PySide/pyside2-setup.git

cd pyside2-setup

# Build wheel
python setup.py bdist_wheel --standalone --qmake=/path/to/bin/qmake --cmake=/path/to/bin/cmake --openssl=/path/to/openssl/bin

cp dist/*.whl $WHEELHOUSE
echo $WHEELHOUSE
ls $WHEELHOUSE
cd ..
