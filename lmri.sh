#!/bin/bash
ENV="lmri"
eval "$(conda shell.bash hook)"
conda activate $ENV
python3 scripts/eval_fid.py