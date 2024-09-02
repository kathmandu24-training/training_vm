### 1) Create VM

<p>Create a new virtual machine using the iso below, selecting Linux and Ubuntu64 as the Type and Version. Select sufficient memory (i.e. in green zone just before the redzone) and a minimum of 2 cpus. For the hard disk, select the 'Create a virtial hard disk now' option. Choose VDI and dynamically allocated. Choose 1TB as the size.</p>

https://releases.ubuntu.com/focal/ubuntu-20.04.6-desktop-amd64.iso

### 2) Install Ubuntu

<p>Follow instructions as directed on screen to install Ubuntu. Choose minimal installation. Restart when prompted.</p>

### 3) Run an update

    sudo apt-get update
    sudo apt-get upgrade
    reboot

### 4) Install the following software

    mkdir ~/src
    sudo apt-get install gcc make git
    sudo apt-get install gnuplot

### 5) Install guest additions

<p>Insert and run the guest additions. Set the Shared Clipboard and Drag and Drop to be bidirectional. Restart the machine. Don't forget to eject the Guest Additons disk.</p>

### 6) Install singularity as root
    sudo apt-get install crun
    sudo apt-get install uidmap fuse2fs cryptsetup-bin runc
    wget https://github.com/sylabs/singularity/releases/download/v4.1.2/singularity-ce_4.1.2-focal_amd64.deb
    sudo dpkg -i singularity-ce_4.1.2-focal_amd64.deb
    rm singularity-ce_4.1.2-focal_amd64.deb
    
### 7) Define a global variable $MINICONDA

    sudo nano /etc/profile.d/miniconda.sh 

<p>Add the following line to the file:</p>

    export MINICONDA=/home/manager/miniconda
    
### 8) Reboot

     sudo reboot

### 9) Clone the repo for installing the software

    git clone https://github.com/kathmandu24-training/training_vm.git
    cd training_vm

### 10) Install miniconda

<p>Install latest version of miniconda for Python 3</p> 

    ./install_miniconda.sh
    
### 11) Install the software

<p>Install the softare in a specific conda environment and add a line to the bashrc to activate that environment.</p>

    ./install_conda_software.sh

### 12) Install the nextflow pipelines

    ./install_nf_pipelines.sh    
    
### 13) Install the additional software not available in a conda channel

    ./install_vcf2pseodogenome.sh
    ./install_bactinspector.sh
    ./install_remove_blocks.sh
    ./install_convert_tsv_to_embl.sh
    sudo apt-get install seaview
    
### 14) To enable shared folders
        
    sudo usermod -a -G vboxsf manager

### 15) Install tree

    sudo apt-get install tree

### 16) Install Excel/Powerpoint equivalent (LibreOffice)

### 17) Add terminal, screenshot, Excel/Powerpoint and firefox to the menu

### 18) Create an additional user bioinf

   sudo useradd -m -s /bin/bash other
   
   sudo passwd other

### 19) Clear the history

    history -c

