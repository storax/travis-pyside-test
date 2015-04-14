#!/bin/bash

echo "Deploying"
pip install pip2pi
git clone https://github.com/storax/travis-pyside-test.git
cd travis-pyside-test
git config user.name "David Zuber"
git config user.email "zuber.david@gmx.de"
git checkout gh-pages
cd ..
cp $WHEELHOUSE/*.whl travis-pyside-test
dir2pi --no-symlink --normalize-package-names travis-pyside-test
cd travis-pyside-test
git add -A
git commit -m"Add PySide build $TRAVIS_BUILD_NUMBER to index."
git remote set-url origin "https://${GITHUBUSERNAME}:${GITHUBPASSWORD}@github.com/stoax/travis-pyside-test.git"
git push origin gh-pages
