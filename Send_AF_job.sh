#!/bin/bash
#SBATCH --job-name=jobname   # Job name
#SBATCH --mail-type=ALL            	    # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=yourusername@ufl.edu     # Where to send mail	
#SBATCH --nodes=1                     	# Use one node
#SBATCH --time=200:00:00               	# Time limit hrs:min:sec
#SBATCH --mem=1gb                   	# Memory limit
#SBATCH --output=path_for_outfile.out   	# Standard output and error log

pwd; hostname; date

./LoopSubmit_alphafold_job.sh

# ./BatchAlphafold_nomsa.sh # change the path 


date
