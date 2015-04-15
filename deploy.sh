#!/bin/bash
if ([ ! -z "$TRAVIS_TAG" ]) && [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  echo "Deploying"
  pip install pip2pi
  cd ../../
  git clone https://github.com/storax/travis-pyside-test.git deploy
  cd deploy
  git config user.name "David Zuber"
  git config user.email "zuber.david@gmx.de"
  git checkout gh-pages
  cp $WHEELHOUSE/*.whl .
  dir2pi --no-symlink --normalize-package-names .
  git add -A
  git commit -m"Add PySide build ${TRAVIS_BUILD_NUMBER} to index."
  git pull origin gh-pages
  git push -q "https://${GITHUBTOKEN}@github.com/storax/travis-pyside-test.git" gh-pages
else
  echo "Will not deploy because this is not a tagged release!"
fi
