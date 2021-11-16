#!/bin/bash -l
#SBATCH -N $N_nodes
#SBATCH -n $N_cores
#SBATCH -t $time_requested
#SBATCH --mem=${memory}G
#SBATCH --partition=$partition_name
#SBATCH --nodelist=$node_list

#SBATCH --array=$node_array
#SBATCH --output=$submit_dir/logs/job_array_example_%A_%a.out
#SBATCH --error=$submit_dir/logs/job_array_example_%A_%a.err

srun $singExec_fullname
