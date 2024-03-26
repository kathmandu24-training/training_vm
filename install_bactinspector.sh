#!/bin/bash
#
# Bespoke recipie to install bactinspector via conda
# Author: Jacqui Keane
#
# Usage: install_bactinspector.sh
#

set -x
set -eu

export MINICONDA="$HOME/miniconda"
export MINICONDA_BIN_LOCATION="$MINICONDA/bin"
export PATH="$MINICONDA_BIN_LOCATION:$PATH"

source $MINICONDA/etc/profile.d/conda.sh

# Take a copy of the software repository
cd ~/src
wget https://gitlab.com/antunderwood/bactinspector/-/archive/0.1.3/bactinspector-0.1.3.tar.gz
tar -xf bactinspector-0.1.3.tar.gz

# Create bactinspctor conda profile
#conda create -n bactinspector-0.1.3 python=3.8
#conda activate bactinspector-0.1.3

conda activate qc

# Install dependencies
conda install mash=2.3

# Install bactinspctor
cd bactinspector-0.1.3
python setup.py install
#pip3 install bactinspectorMax

conda deactivate

# Tidy up
cd ..
rm bactinspector-0.1.3.tar.gz
rm -rf bactinspector-0.1.3

set +eu
set +x
