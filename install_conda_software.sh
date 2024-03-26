#!/bin/bash
#
# Script to install the list of software in software.txt via conda
# Author: Jacqui Keane
#
# Usage: install_conda_software.sh
#

set -x
set -eu

export MINICONDA="$HOME/miniconda"
export MINICONDA_BIN_LOCATION="$MINICONDA/bin"
export PATH="$MINICONDA_BIN_LOCATION:$PATH"

source $MINICONDA/etc/profile.d/conda.sh

# Install software
echo "Reading bioconda software list!"
while read -r line;
do
    echo "Installing ${line}"
    # Split line on comma into environment and software list
    IFS=',' read -a myarray <<<  $line
    environment=${myarray[0]}
    software=${myarray[1]}
    # Create a new conda environment with the software
    conda create -n $environment $software
done < software.txt

set +eu
set +x
