#!/bin/bash

# Submit this script with: sbatch <this-filename>

#SBATCH --time=24:00:00   # walltime
#SBATCH --ntasks=5   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH -J "rs4"   # job name

## /SBATCH -p general # partition (queue)
#SBATCH -o rs4-slurm.%N.%j.out # STDOUT
#SBATCH -e rs4-slurm.%N.%j.err # STDERR

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE
python -u -c "import PyHippocampus as pyh; import DataProcessingTools as DPT; import os; import time; print(time.localtime()); os.chdir('session01'); pyh.RPLSplit(channel=[*range(97,125)], SkipHPC=False, HPCScriptsDir = '/data/src/PyHippocampus/', SkipSort=False); print(time.localtime());"
