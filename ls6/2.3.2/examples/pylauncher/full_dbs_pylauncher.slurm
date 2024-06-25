#!/bin/bash
# full_dbs_pylauncher.slurm
# -----------------------------------------------------------------
#SBATCH -J af2_pylauncher_job            # Job name
#SBATCH -o af2_pylauncher_job.%j.out     # Name of stdout output file
#SBATCH -e af2_pylauncher_job.%j.err     # Name of stderr output file
#SBATCH -p gpu-a100                      # Queue (partition) name
#SBATCH -N 2                             # Total # of nodes
#SBATCH -n 6                             # Total # of mpi tasks
#SBATCH -t 8:00:00                       # Run time (hh:mm:ss)
#SBATCH -A my_project                    # Project/Allocation name
# -----------------------------------------------------------------

# Load modules
module unload xalt
module load python3
module load pylauncher
module use /scratch/tacc/apps/bio/alphafold/modulefiles
module load alphafold/2.3.2-ctr

echo -n "starting at: "
date

mkdir -p $SCRATCH/af2_pylauncher_job

# Run Alphafold with pylauncher
python3 af2_full_dbs_launcher.py

echo -n "ending at: "
date
