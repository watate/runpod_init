# Install Miniconda to /workspace/tools
mkdir -p tools/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh -O tools/miniconda3/miniconda.sh
bash tools/miniconda3/miniconda.sh -b -u -p tools/miniconda3

source tools/miniconda3/bin/activate

# Create env in persistent location
sudo mkdir -p envs
sudo chown -R $USER:$USER envs
conda create -p envs/algoverse-env python=3.11 -y
conda activate envs/algoverse-env

# Install requirements (inside arena-env)
pip install -r requirements.txt
python -m ipykernel install --sys-prefix --name algoverse-env --display-name "Python (algoverse-env)"