# runpod_init
How to persist your python dependencies in Runpod

Requirements:
- Know how to start an instance on Runpod
- Be in `/workspace`
- Use network volume on Runpod (helps you switch between GPUs!)

The two scripts:
- Use commands in `miniconda_init.sh` to set up a new pod
- Add `activate_conda.sh` to /workspace
- Run the code below every time you start a new pod to activate your env:
```
echo 'source /workspace/activate_conda.sh' >> ~/.bashrc
```