#!/usr/bin/env bash
set -euxo pipefail

# ===============================
# 0. Config you might want to tweak
# ===============================
CONDA_DIR="/workspace/miniconda3"
ENV_NAME="arena-env"
REQ_FILE="ARENA_3.0/requirements.txt"   # change if your requirements.txt lives elsewhere
PYVER="3.11"

# ===============================
# 1. Clean old installs (optional but safe)
#    Comment these two lines out if you DON'T want to wipe & recreate
# ===============================
rm -rf "${CONDA_DIR}"
rm -rf "$HOME/.conda"

# ===============================
# 2. Install Miniconda silently into CONDA_DIR
# ===============================
mkdir -p "${CONDA_DIR}"
curl -L "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" -o "${CONDA_DIR}/miniconda.sh"

bash "${CONDA_DIR}/miniconda.sh" -b -u -p "${CONDA_DIR}"

rm "${CONDA_DIR}/miniconda.sh"

# ===============================
# 3. Enable 'conda' in THIS shell
#    This is the key trick that replaces "open a new terminal"
# ===============================
# conda has a helper that prints shell code to set PATH + functions.
# We eval that so this script can call `conda` and `conda activate` right away.
eval "$(${CONDA_DIR}/bin/conda shell.bash hook)"

# (Optional for future shells): write conda init to ~/.bashrc
# This makes `conda activate` work automatically next login / new terminal.
conda init bash || true

# ===============================
# 4. Create fresh env with Python, pip, ipykernel
#    We use conda-forge and --override-channels to avoid the TOS token bug.
# ===============================
conda create -n "${ENV_NAME}" python="${PYVER}" pip ipykernel \
  -c conda-forge --override-channels -y

# Activate it (now that `conda shell.bash hook` ran, this works in-script)
conda activate "${ENV_NAME}"

# ===============================
# 5. Install project dependencies
#    Use pip here, not conda install -r
# ===============================
if [ -f "${REQ_FILE}" ]; then
    pip install -r "${REQ_FILE}"
else
    echo "WARNING: requirements file not found at ${REQ_FILE}, skipping pip install"
fi

# ===============================
# 6. Register this env as a Jupyter kernel for VS Code / notebooks
# ===============================
python -m ipykernel install --user --name "${ENV_NAME}" --display-name "Python (${ENV_NAME})"

echo "Environment '${ENV_NAME}' is ready."
echo "You can now select 'Python (${ENV_NAME})' as the kernel in VS Code / Jupyter."
