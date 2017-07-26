#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")";

wget https://repo.continuum.io/archive/Anaconda3-4.4.0-MacOSX-x86_64.sh

# Install in batch mode
bash Anaconda3-4.4.0-MacOSX-x86_64.sh -b

# Install in a batch mode required to add path
export PATH="~/anaconda3/bin:$PATH"

# add path to ~/.path
echo # For anaconda >> ~/.path
echo export PATH='~/anaconda3/bin:$PATH' >> ~/.path


# Update anaconda root enviroment to the latest
conda update -y --all

# Clean old packages and free memory
conda clean -y --all

# Install importent packages
conda install -y future
