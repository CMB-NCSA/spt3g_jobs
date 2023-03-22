#!/bin/bash

# This is the main list that we will loop over
LOOP_FILE_LIST=$loop_list
# Read in the whole LOOP_FILE_LIST at once and store as an array
LOOP_LIST=($$(<$${LOOP_FILE_LIST}))
# Select the index in the array using the internal variable SLURM_ARRAY_TASK_ID
INPUTLIST=$${LOOP_LIST[$${SLURM_ARRAY_TASK_ID}]}
# Define the singularity image to use
SINGULARITY_APP=$singularity_cache/$singularity_image
# Make the wrapper with the cmd_call
DATE=`date +"%F%Z%R"`
WRAPPER_NAME=$$PWD/wrapper_$${DATE}_$${SLURM_ARRAY_TASK_ID}.sh
echo "#!/bin/bash" > $$WRAPPER_NAME
echo $cmd_init >> $$WRAPPER_NAME
echo $cmd_call >> $$WRAPPER_NAME
chmod +x $$WRAPPER_NAME

echo ""
echo "------------ Job variables ---------------------"
echo "Singulary image: $${SINGULARITY_APP}"
echo "Input list: $${INPUTLIST}"
echo "WRAPPER_NAME: $${WRAPPER_NAME}"
echo "Running command:"
echo " ${cmd_init}"
echo " ${cmd_call}"
echo ""

singularity exec --bind /projects $$SINGULARITY_APP $$WRAPPER_NAME
