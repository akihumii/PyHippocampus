#!/bin/bash

# Submit this script with: sbatch <this-filename>

#SBATCH --time=1:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=1M   # memory per CPU core
#SBATCH -J "example-job"   # job name
#SBATCH --mail-user=<your-email>@nus.edu.sg   # email address

# Notify at the beginning, end of job and on failure.
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

## /SBATCH -p general # partition (queue)
## /SBATCH -o align-slurm.%N.%j.out # STDOUT
## /SBATCH -e align-slurm.%N.%j.err # STDERR

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE
# this script can be used like this:
# [picasso]$ for i in *; 
#     do echo $i; cd $i; sbatch /data/src_shihcheng/PyHippocampus/align-umaze-slurm.sh; 
#     cd ..; done
python -c "import PyHippocampus as pyh; pyh.aligning_objects(); pyh.Umaze(saveLevel=1)"
