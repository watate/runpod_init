# Miniconda silent install
mkdir -p /workspace/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /workspace/miniconda3/miniconda.sh
bash /workspace/miniconda3/miniconda.sh -b -u -p /workspace/miniconda3
rm /workspace/miniconda3/miniconda.sh

# Open new terminal, and run
source /workspace/miniconda3/bin/activate

# Initialize conda on all available shells
conda init --all

# Open new terminal, Create arena-env
conda create -p /workspace/arena-env python=3.11 -y
conda activate /workspace/arena-env

# (If dependencies are not installed)
pip install -r ARENA_3.0/requirements.txt
# conda install ipykernel --update-deps --force-reinstall -y

# This creates the arena-env python kernel
python -m ipykernel install --user --name arena-env --display-name "Python (arena-env)"

# For deleting huggingface cache
rm -rf /workspace/.cache/huggingface


# Old code
/workspace/miniconda3/bin/conda init
source ~/.bashrc
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r
/workspace/miniconda3/bin/conda create -n arena-env python=3.11 -y
/workspace/miniconda3/bin/conda activate arena-env
/workspace/miniconda3/envs/arena-env/bin/pip install -r ~/ARENA_3.0/requirements.txt 
/workspace/miniconda3/bin/conda install -n arena-env ipykernel --update-deps --force-reinstall -y
conda activate arena-env
python -m ipykernel install --user --name arena-env --display-name "Python (arena-env)"