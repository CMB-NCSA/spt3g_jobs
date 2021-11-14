#!/bin/bash

# This is the main list that we will loop over
LOOP_FILE_LIST=$loop_list

# Read in the whole LOOP_FILE_LIST at once and store as an array
LOOP_LIST=($$(<$${LOOP_FILE_LIST}))

# Select the index in the array using the internal variable SLURM_ARRAY_TASK_ID
INPUTLIST=$${LOOP_LIST[$${SLURM_ARRAY_TASK_ID}]}

# Define the OUTDIR
OUTDIR=$outdir

# Define the singularity image to use
SINGULARITY_APP=$singularity_cache/$singularity_image

singularity exec --bind /projects $$SINGULARITY_APP $cmd_call
