from distutils.core import setup
import glob

# Get the scripts/bin files
bin_files = glob.glob("bin/*")

# Build the structure for etc folder
etc_dirs = ['etc']
data_files = [("", ["setpath.sh"])]
# In case we want files in etc
for edir in etc_dirs:
    data_files.append((edir, glob.glob("{}/*".format(edir))))

# The main call
setup(name='spt3g_jobs',
      version='0.1',
      license="GPL",
      description="ICC slurm jobs for SPT3G/CAPS",
      author="Felipe Menanteau",
      author_email="felipe@illinois.edu",
      packages=['spt3g_jobs'],
      package_dir={'': 'python'},
      scripts=bin_files,
      package_data={'': ['LICENSE']},
      data_files=data_files,
      )
