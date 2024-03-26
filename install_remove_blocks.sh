#!/bin/bash
#
# Bespoke recipie to install remove_blocks via conda
# Author: Jacqui Keane
#
# Usage: install_remove_blocks.sh
#

set -x
set -eu

export MINICONDA="$HOME/miniconda"
export MINICONDA_BIN_LOCATION="$MINICONDA/bin"
export PATH="$MINICONDA_BIN_LOCATION:$PATH"

source $MINICONDA/etc/profile.d/conda.sh

# Take a copy of the software repository
cd ~/src
wget https://github.com/sanger-pathogens/remove_blocks_from_aln/archive/refs/tags/0.1.tar.gz
tar -xvf 0.1.tar.gz

# Create remove_blocks conda profile
conda create -n remove-blocks-0.1 python=2.7
conda activate remove-blocks-0.1

# Install remove_blocks_from_aln
cd remove_blocks_from_aln-0.1
python setup.py test
python setup.py install
conda deactivate 

# Tidy up
cd ..
rm 0.1.tar.gz
rm -rf remove_blocks_from_aln-0.1

set +eu
set +x
