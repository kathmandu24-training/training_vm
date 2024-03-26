#!/bin/bash
#
# Bespoke recipie to install vcf2pseudogenomes.sh via conda
# Author: Jacqui Keane
#
# Usage: install_vcf2pseudogenomes.sh
#

set -x
set -eu

export MINICONDA="$HOME/miniconda"
export MINICONDA_BIN_LOCATION="$MINICONDA/bin"
export PATH="$MINICONDA_BIN_LOCATION:$PATH"

source $MINICONDA/etc/profile.d/conda.sh

# Take a copy of the software 
cd ~/src
wget https://raw.githubusercontent.com/nf-core/bactmap/master/bin/vcf2pseudogenome.py
chmod 777 vcf2pseudogenome.py

# Put the script in the bin directory
cp vcf2pseudogenome.py ~/miniconda/envs/snp-phylogeny/bin/

set +eu
set +x
