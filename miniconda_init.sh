# Install Miniconda to /workspace/tools
mkdir -p /workspace/tools/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /workspace/tools/miniconda3/miniconda.sh
bash /workspace/tools/miniconda3/miniconda.sh -b -u -p /workspace/tools/miniconda3

# Create env in persistent location
mkdir -p /workspace/envs
conda create -p /workspace/envs/arena-env python=3.11 -y
conda activate /workspace/envs/arena-env

# Install requirements (inside arena-env)
pip install -r ARENA_3.0/requirements.txt
python -m ipykernel install --sys-prefix --name arena-env --display-name "Python (arena-env)"