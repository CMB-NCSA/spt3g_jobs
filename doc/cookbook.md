Installation:
-------
We need to use the miniconda installation on the ICC `projects` file system
```
source /projects/caps/spt3g/opt/miniconda3/bin/activate
```
Now git clone and install into miniconda path
```
git clone https://github.com/CMB-NCSA/spt3g_jobs.git 
cd spt3g_jobs.git
python setup.py install 
```

Environment:
-----
We need to use the miniconda installation on the ICC `projects` file system
```
source /projects/caps/spt3g/opt/miniconda3/bin/activate
source ~/spt3g_jobs/setpath.sh ~/spt3g_jobs
```

Cookbook 
--------
#### To see the availanle nodes on the ICC
```
sinfo --partition caps -N
```

#### Example 1

1. Create a series of lists containing filelists 100 g3 files each at 90GHz

   ```chunk_filelist /data/spt3g/raw/*/*90*.g3.gz  --outdir ~/jobs/lists  --basename files_90GHz --nperchunk 100```

   This will create a set of file lists on `~/jobs/lists` with main file: `loop_list` in: `jobs/lists/files_90GHz_main.list` that we will use in the next step.

2. Create the input files to run slum jobs using arrays

   ```create_jobs -c SPT3G_JOBS_DIR/etc/spt3g_ingest_example.yaml --loop_list jobs/lists/files_90GHz_main.list --submit_dir submit_dir_90GHz```

   This will create the two files needs to run `slurm`
   ```
   # Slurm submit file: job/submit_dir/submitN.sl
   # SingleExec file: job/submit_dir/singExec.sh
   ```
3. Submit the job:
   ```
   sbatch job/submit_dir/submitN.sl
   ```
   
 #### Example 2
 
Run 40 wide on all 90GHz files

1. Create a series of lists containing 40 file lists (chunks) with all of the 90 GHz files
   ```
   chunk_filelist /projects/caps/spt3g/raw/*/*90GHz* --outdir ~/slurm-jobs/lists --basename files_90GHz --nchunks 40
   ```
   This will create a set of file lists on `~/jobs/lists` with main file: `loop_list` in: `jobs/lists/files_90GHz_main.list` that we will use in the next step.

2. Create the input files to run slum jobs using arrays
   ```
   create_jobs -c spt3g_ingest_90GHz.yaml  --loop_list /home/felipe/slurm-jobs/lists/files_90GHz_main.list --submit_dir submit_dir_90GHz
   ```
   This will create the two files needs to run `slurm`
   ```
   # Slurm submit file: job/submit_dir/submitN.sl
   # SingleExec file: job/submit_dir/singExec.sh
   ```
3. Submit the job:
   ```
   sbatch job/submit_dir/submitN.sl
   ```
