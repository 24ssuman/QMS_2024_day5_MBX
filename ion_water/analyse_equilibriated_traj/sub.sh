#!/bin/bash

#SBATCH --job-name="run1"
#SBATCH --output="stdout"
#SBATCH --error="stderr"
#SBATCH --partition=shared
##SBATCH --partition=compute
##SBATCH --partition=debug
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32
##SBATCH --mem=64GB
#SBATCH -A csd808
#SBATCH --export=ALL
#SBATCH -t 24:00:00

# Load modules
module load cpu/0.15.4  gcc/9.2.0  gsl/2.5  openmpi/3.1.6 fftw/3.3.8 python/3.8.5 py-numpy/1.19.2-openblas

cd $SLURM_SUBMIT_DIR
lammps=/home/s7saha/software/MBX_updated_lmp_plumed/bin/lmp_mbx_noplumed

export OMP_NUM_THREADS=1

srun --mpi=pmi2 --cpus-per-task=$OMP_NUM_THREADS -n 32 $lammps -in lmp.in -log log > out 2> error
