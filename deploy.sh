#!/bin/bash

pip install pip2pi
git clone https://github.com/storax/travis-pyside-test.git
cd travis-pyside-test
git checkout gh-pages
cd ..
cp $WHEELHOUSE/*.whl travis-pyside-test
dir2pi --no-symlink --normalize-package-names travis-pyside-test
cd travis-pyside-test
git add -A
git commit -m"Add PySide build $TRAVIS_BUILD_NUMBER to index."
url="https://$GITHUBUSERNAME:$GITHUBPASSWORD@github.com/stoax/travis-pyside-test.git"
git remote set-url origin $url
git push origin gh-pages
