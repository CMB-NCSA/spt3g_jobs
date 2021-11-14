spt3g_jobs
==============================================

This repo contains recipes to create the inputs to run jobs on the NCSA/ICC

Cookbook Example
--------

1. Create a series of lists containing filelists 100 g3 files each at 90GHz

   ```chunk_filelist /data/spt3g/raw/*/*90*.g3.gz  --outdir ~/jobs/lists  --basename files_90GHz --nperchunk 100```
   
   This will create a set of file lists on `~/jobs/lists` with main file: `loop_list` in: `jobs/lists/files_90GHz_main.list` that we will use in the next step. 

2. Create the input files to run slum jobs using arrays

   ```create_jobs -c etc/spt3g_ingest_example.yaml --loop_list jobs/lists/files_90GHz_main.list```

   This will create the two files needs to run `slurm`
   ```
   # Slurm submit file: job/submit_dir/submitN.sl
   # SingleExec file: job/submit_dir/singExec.sh
   ```
