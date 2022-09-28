#!/bin/bash
#SBATCH --job-name=af_gr_%j
#SBATCH --output=af_gr_%j.out
#SBATCH --error=af_gr_%j.err
#SBATCH --mail-type=NONE
#SBATCH --time=03:00:00
#SBATCH --ntasks=1
#SBATCH --distribution=cyclic:cyclic
#SBATCH --mem-per-cpu=30000
#SBATCH --account=pdixit
#SBATCH --cpus-per-gpu=1
#SBATCH --gpus-per-task=1
#SBATCH --partition=gpu
#SBATCH --constraint=a100

module load cuda/11.1.0
#### CHANGE "username" to your usename -- make sure the path is where the AlphaFold Folder is installed 
export LD_LIBRARY_PATH=/home/username/AlphaFold/colabfold_batch/colabfold-conda/lib
### The following line submits a sequence with a custom MSA for prediction -- the first sequence in seq_199.a3m is the one to be predicted , the following sequences
# are the custom MSA -- if no following sequences are found then it will be scored with no reference / context MSA.
colabfold_batch --amber seq_199.a3m results
####### IF you want AF to make its own MSA then do 
colabfold_batch --amber seq_199.fasta results
# where seq_199.fasta is the fasta file containing one sequence 
