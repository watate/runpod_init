# runpod_init
Runpod initialization stuff

The two scripts:
- Run `miniconda_init.sh` to set up a new pod
- Add `activate_conda.sh` to /workspace
- Run this every time you start a new pod to activate your env:
```
echo 'source /workspace/activate_conda.sh' >> ~/.bashrc
```