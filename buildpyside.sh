#!/bin/bash

# Build pyside wheel

mkdir $WHEELHOUSE

PYSIDE_VERSION=1.2.2
PYSIDE_DIR=PySide-${PYSIDE_VERSION}
PYSIDE_TGZ=PySide-${PYSIDE_VERSION}.tar.gz

pip install wheel

#PySide dependencies from http://pyside.readthedocs.org/en/latest/building/linux.html
sudo apt-get install cmake libqt4-dev libxml2-dev libxslt1-dev libphonon-dev qtmobility-dev phonon-backend-vlc
# Download PySide Source
curl -O https://pypi.python.org/packages/source/P/PySide/${PYSIDE_TGZ}

tar xf $PYSIDE_TGZ
cd $PYSIDE_DIR

# Build wheel
python setup.py bdist_wheel --standalone

cp dist/*.whl $WHEELHOUSE
cp pyside_postinstall.py $WHEELHOUSE
echo $WHEELHOUSE
ls $WHEELHOUSE
cd ..
