#!/usr/bin/env bash

#SBATCH --job-name="mbpol_bulk"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8 
#SBATCH --cpus-per-task=1
#SBATCH --partition=RM-small
#SBATCH --time=00:20:00
#SBATCH --output="stdout"
#SBATCH --error="stderr"
#SBATCH --account=che240027p

module reset
module load intelmpi/2021.3.0-intel2021.3.0 gcc/10.2.0  

lammps=/ocean/projects/che240027p/shared/software/Team_UCSD/lammps_exe/lmp_mpi_mbx

export OMP_NUM_THREADS=1
mpirun -n 8 $lammps -in lmp_rerun.in -log log > out 2> error
