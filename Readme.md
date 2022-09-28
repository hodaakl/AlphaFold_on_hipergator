# AlphaFold_on_hipergator 

This repo contains guidance on how to run AlphaFold on hpg. 

Hpg has its own version of AF that you can use, but it takes much longer to run and the results are not significantly better than the results from the local installation.

Note: you can install this on your own computer too, but it is better to have gpu , this is why if you have gpu allocation on hpg this will be useful. 

----------

1. First install the local version of alpha fold on hiper gator using the link -- follow steps at "FOR LINUX" section. 
https://github.com/YoshitakaMo/localcolabfold


2. After installation you can see flags at

```bash
colabfold_batch -- help
```

If that gives an error - make sure you have added the path to your .bashrc file correctly. 

3. To submit a sequence , use the file "AF_submit_job.sh" for reference. Read through the lines at the beginning
```bash
#SBATCH --job-name=af_gr_%j
#SBATCH --output=af_gr_%j.out
#SBATCH --error=af_gr_%j.err
#SBATCH --mail-type=NONE
#SBATCH --time=03:00:00
#SBATCH --ntasks=1
#SBATCH --distribution=cyclic:cyclic
#SBATCH --mem-per-cpu=30000
#SBATCH --account=YourGroupAccount
#SBATCH --cpus-per-gpu=1
#SBATCH --gpus-per-task=1
#SBATCH --partition=gpu
#SBATCH --constraint=a100
```

and change what is necessary job name, account etc 

---------------------------

### INDEX OF REPO
1. Submit a job when you have a sequence ready through the file AF_submit_job.sh . 
using 
```bash
sbatch AF_submit_job.sh
```
2. If you have many sequences in a directory , you can modify and use the file LoopSubmit_alphafold_job.sh and you can either run it in the terminal using 
```bash
./LoopSubmit_alphafold_job.sh
```
or 
```bash
sbatch Send_AF_job.sh
```

