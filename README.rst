=========================
Travis Pyside Build Tests
=========================

.. image::  https://img.shields.io/travis/storax/travis-pyside-test/master.png?style=flat
    :target: https://travis-ci.org/storax/travis-pyside-test
    :alt: Build Status

Testing travis and build configurations to run pyside on travis ci.

The built wheels are available as a simple `Python package index <https://storax.github.io/travis-pyside-test/simple/>`_

=====
Usage
=====

To built new packages, simply push a tagged commit (use the gitflow workflow for releases). Travis will built PySide and
push them to the github pages website mentioned above.


------------
Installation
------------

Using the package index can be done in multiple ways. Either directly at the installation command or via some sort of `configuration <https://pip.pypa.io/en/latest/user_guide.html#configuration>`_.

+++++++++++++++++++++
Environment Variables
+++++++++++++++++++++

This might be useful for testing on travis ci. You can set pip's commandline options via `environment variables <https://pip.pypa.io/en/latest/user_guide.html#environment-variables>`_::

  export PIP_INDEX_URL="https://storax.github.io/travis-pyside-test/simple/"
  # Fallback to the normal index
  export PIP_EXTRA_INDEX_URL="https://pypi.python.org/simple"


++++++++++++++++++
User Configuration
++++++++++++++++++

You can specify in your `config file <https://pip.pypa.io/en/latest/user_guide.html#config-file>`_ what index to use. Either per user, site wide, or per virtual env.
Add the following lines to ``~/.config/pip.conf``::

  [global]
  index-url = https://storax.github.io/travis-pyside-test/simple/
  extra-index-url = https://pypi.python.org/simple

+++++++++++++++
Setup on travis
+++++++++++++++

Now to finally use PySide on Travis-CI, you need some extra steps. First set the index like mentioned above. Then install PySide via pip (or if you are using tox, tox will do it for you).
After installation you have to execute (you might need sudo rights)::

  python pyside_postinstall.py -install

Now create a virtual framebuffer, so PySide thinks there is a display device::

  # Create virtual frame buffer because we run on headless machine
  Xvfb :0 -screen 0 1600x1200x24 &
  export DISPLAY=:0.0
