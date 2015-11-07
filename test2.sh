#!/bin/bash

pip install -v -f $WHEELHOUSE --no-index pyside2

#test
python -c "from PySide2.QtGui import *"
python sampleapp2.py
