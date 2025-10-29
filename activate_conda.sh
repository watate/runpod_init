# Source this from ~/.bashrc – lives in /workspace so it persists export PATH="/workspace/tools/miniconda3/bin:$PATH"
export PATH="/workspace/tools/miniconda3/bin:$PATH"
source /workspace/tools/miniconda3/etc/profile.d/conda.sh
export CONDA_PKGS_DIRS=/workspace/.conda/pkgs
export CONDA_ROOT=/workspace/.conda
export JUPYTER_PATH=/workspace/share/jupyter
export JUPYTER_DATA_DIR=/workspace/.local/share/jupyter
# (optional) auto-activate your env
conda activate /workspace/envs/arena-env