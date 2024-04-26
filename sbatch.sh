#!/bin/bash
# check locally: bash sbatch_generate.sh

#SBATCH --job-name=bicycle
#SBATCH --mail-type=ALL
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --time=6:00:00
#SBATCH --array=1-6
#SBATCH --partition=debug
 #SBATCH --qos=short
 #SBATCH --qos=expedite #expedite 6 hours, short 2 hours
#SBATCH --output=log/%x_%A_%a.log
 #SBATCH --error=log/%x_%A_%a.err
 #SBATCH --nice=200 #larger number with smaller priority
 #SBATCH --begin=23:00:00
 #SBATCH --test-only


echo "SLURM_JOBID: " $SLURM_JOBID
echo "SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
echo "SLURM_ARRAY_JOB_ID: " $SLURM_ARRAY_JOB_ID
echo "SLURM_JOB_ACCOUNT: " $SLURM_JOB_ACCOUNT
echo "SLURM_JOB_NAME: " $SLURM_JOB_NAME
echo "SLURM_NTASKS: " $SLURM_NTASKS
echo "SLURMD_NODENAME: " $SLURMD_NODENAME
echo "SLURM_PROCID: " $SLURM_PROCID
date

#for i in {1..6}; do python decoder_setup.py --code_flag $i --error_rate 0.006 &; done

./env/bin/python test.py

#echo ./env/bin/python -u decoder_setup.py --code_flag $SLURM_ARRAY_TASK_ID --error_rate 0.006

./env/bin/python -u decoder_setup.py --code_flag $SLURM_ARRAY_TASK_ID --error_rate 0.003

date


