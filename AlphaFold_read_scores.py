# Author: Hoda Akl
# This code reads the prediction pdb file for the first rank relaxed model and gets the plddt score from there for each sequence and saves it in a dictionary.

import numpy as np 
import matplotlib.pyplot as plt 
from collections import defaultdict
import json
import os
from glob import glob
import pandas as pd
from biopandas.pdb import PandasPdb
ppdb = PandasPdb().fetch_pdb('3eiy')



## number of sequences scored
ng = 1000
## initialize the dictionary
af_bpt1_res = defaultdict(lambda: 'not present')
fol = f'/Results_Fixed_MSA/' ## replace with path to output folder where the results folders are from alpha fold. 
plddt_avg = np.zeros(ng)
## for each sequence scored 
for seqi in range(ng): 
    if seqi%100==0:
        print(f' sequence {seqi}')
    ## DEFINE subfolder 
    subfol = f'{fol}Seq_{seqi}/'
#     ## change directory
    if os.path.exists(subfol):
        os.chdir(subfol)
        # grab highest ranking relaxed model 
        fn = glob(f'*relaxed_rank_1_model_*.pdb')


        if len(fn)==1:
            fn = fn[0]
    #         print(fn)
            # read as pandas dataframe 
            df = ppdb.read_pdb(path = fn)
            bd = ppdb.df['ATOM']
            array = bd.to_records(index=False)

            # print(array['residue_number'])
            res_arr = array['residue_number']
            type(res_arr)
            pos, idx = np.unique(res_arr, return_index=True)
            len(idx)
            plddt = array['b_factor']
            plddt_arr = plddt[idx]
            af_bpt1_res[f'Seq{seqi}'] = plddt_arr
            plddt_avg[seqi]  = np.mean(plddt_arr)
        else:
            # something is wrong with reading the files 
            print(f' seq = {seqi} can not be read , either no files or more than one file was rank 1, check directory to debug, setting entry to None')
            plddt_avg[seqi]= None
    else:
        print(f'No results for seq {seqi} found')
## store the average 
af_bpt1_res[f'plddt_avg'] = plddt_avg
# print(f'done with k = {k}')
# af_bpt1_res[f'k{k}'] = dict(af_bpt1_res[f'k{k}'])
# print(af_bpt1_res)

np.save('af_plddt_results.npy', dict(af_bpt1_res))
