#!/bin/bash

pip install -v -f $WHEELHOUSE --no-index pyside
# Create virtual frame buffer because we run on headless machine
Xvfb :0 -screen 0 1600x1200x24 &
export DISPLAY=:0.0

#test
python -c "from PySide.QtGui import *"
python sampleapp.py
