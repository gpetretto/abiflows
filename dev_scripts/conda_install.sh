#!/bin/bash
set -e  # exit on first error

echo "Installing AbiPy dependencies with conda."
echo "Adding conda-forge, matsci and abinit to channels"
echo "Working in CONDA_PREFIX: ${CONDA_PREFIX} ..."
conda config --add channels conda-forge
conda config --add channels matsci
conda config --add channels abinit

echo "Installing requirements listed requirements.txt and requirements-optional.txt ..."
# https://github.com/ContinuumIO/anaconda-issues/issues/542
conda install -y -c anaconda setuptools
#conda install -c blaze flask-mongoengine
conda install -y --file ./requirements.txt
conda install -y --file ./requirements-optional.txt

echo "Installing bader executable (http://theory.cm.utexas.edu/henkelman/code/bader/) from matsci ..."
conda install -y -c matsci bader

# Install abinit from abinit conda channel.
conda install -y -c gmatteo abinit=${ABINIT_VERSION}
abinit --version
abinit --build

echo "Installation completed"