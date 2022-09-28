#!/bin/bash
# PROTEIN=BPT1
for k in {2,4,8,16,32,64}
do
    echo $k
    mkdir /blue/pdixit/hodaakl/A4PSV/StructureAnalysis/BPT1_StructureAnalysis/AF/k${k}/GapRemoved_allz_Results
    cd /blue/pdixit/hodaakl/A4PSV/StructureAnalysis/BPT1_StructureAnalysis/AF/k${k}/Sequences_w_gaps_allz/
    for seqnum in {0..199}
    do
        # edit the line in the submission file to send sequence index seqnum
        sed -i "19s/.*/colabfold_batch --amber seq_${seqnum}.a3m \/home\/hodaakl\/blue_pdixit\/hodaakl\/A4PSV\/StructureAnalysis\/BPT1_StructureAnalysis\/AF\/k${k}\/GapRemoved_allz_Results\/seq_${seqnum}/" /blue/pdixit/hodaakl/SH_FILES/AF_Submission_Directory/AF_submit_no_msa.sh
        # print that line , will be useful in debugging in the .out file
        CURRLINE=$(sed '19!d' /blue/pdixit/hodaakl/SH_FILES/AF_Submission_Directory/AF_submit_no_msa.sh)
        echo "Reading current line in the file is:  ${CURRLINE}"
        # count the number of jobs on gpu currently 
        N_JOBS=$(squeue -A pdixit | grep gpu | wc -l)
        ## Wait if number of gpus used is greater than 9 -- because we have only 10 gpus
        while [ $N_JOBS -gt 9 ]
        do 
            sleep 10s 
            echo "sleeping for 10s"
            N_JOBS=$(squeue -A pdixit | grep gpu | wc -l)
        done
        # sleep 10s
        ### SUBMIT the job
        sbatch /blue/pdixit/hodaakl/SH_FILES/AF_Submission_Directory/AF_submit_no_msa.sh
        echo 'submitted job'
    done
    done
    echo
    echo "done with k$k"
done
#### for the OG Sequences 
# for k in {2,4,8,16,32,64}
# do
    # echo $k
# cd /blue/pdixit/hodaakl/A4PSV/StructureAnalysis/BPT1_StructureAnalysis/AF/OG/Seqs_Fixed_MSA
# for seqnum in {2287..14012}
# do
#     sed -i "19s/.*/colabfold_batch --amber comb_msa_BPT1_OG_seq${seqnum}.a3m \/home\/hodaakl\/blue_pdixit\/hodaakl\/A4PSV\/StructureAnalysis\/BPT1_StructureAnalysis\/AF\/OG\/Results_Fixed_MSA\/Seq_${seqnum}/" /blue/pdixit/hodaakl/SH_FILES/AF_Submission_Directory/AF_submit_no_msa.sh
#     CURRLINE=$(sed '19!d' /blue/pdixit/hodaakl/SH_FILES/AF_Submission_Directory/AF_submit_no_msa.sh)
#     echo "Reading current line in the file is:  ${CURRLINE}"
#     N_JOBS=$(squeue -A pdixit | grep gpu | wc -l)
#     ### get the number of jobs running on gpu 
#     while [ $N_JOBS -gt 9 ]
#     do 
#         sleep 10s 
#         echo "sleeping for 10s"
#         N_JOBS=$(squeue -A pdixit | grep gpu | wc -l)
#     done
#     ### SUBMIIIITTTT the job
#     sbatch /blue/pdixit/hodaakl/SH_FILES/AF_Submission_Directory/AF_submit_no_msa.sh
#     echo "submitted job for natural sequence ${seqnum}"
#     echo
# done
# done

#### FOR ARDCA BPT1
# cd /blue/pdixit/hodaakl/A4PSV/StructureAnalysis/BPT1_StructureAnalysis/AF/ArDCA/Sequences
# for seqnum in {0..999}
# do
#     sed -i "19s/.*/colabfold_batch --amber Seq_${seqnum}.a3m \/home\/hodaakl\/blue_pdixit\/hodaakl\/A4PSV\/StructureAnalysis\/BPT1_StructureAnalysis\/AF\/ArDCA\/no_msa_results\/Seq_${seqnum}/" /blue/pdixit/hodaakl/SH_FILES/AF_Submission_Directory/AF_submit_no_msa.sh
#     CURRLINE=$(sed '19!d' /blue/pdixit/hodaakl/SH_FILES/AF_Submission_Directory/AF_submit_no_msa.sh)
#     echo "Reading current line in the file is:  ${CURRLINE}"
#     N_JOBS=$(squeue -A pdixit | grep gpu | wc -l)
#     ### get the number of jobs running on gpu 
#     while [ $N_JOBS -gt 8 ]
#     do 
#         sleep 10s 
#         echo "sleeping for 10s"
#         N_JOBS=$(squeue -A pdixit | grep gpu | wc -l)
#     done
#     ### SUBMIIIITTTT the job
#     sbatch /blue/pdixit/hodaakl/SH_FILES/AF_Submission_Directory/AF_submit_no_msa.sh
#     echo "submitted job for natural sequence ${seqnum}"
#     echo
# done
# done
##### VAEEEEEEE
# for k in {2,4,8,16,32,64}
# do
#     echo k=$k
#     cd /blue/pdixit/hodaakl/A4PSV/StructureAnalysis/BPT1_StructureAnalysis/AF/VAE/k${k}/Sequences
#     for seqnum in {0..999}
#     do
#         sed -i "19s/.*/colabfold_batch --amber Seq_${seqnum}.a3m \/home\/hodaakl\/blue_pdixit\/hodaakl\/A4PSV\/StructureAnalysis\/BPT1_StructureAnalysis\/AF\/VAE\/k${k}\/no_msa_results\/Seq_${seqnum}/" /blue/pdixit/hodaakl/SH_FILES/AF_Submission_Directory/AF_submit_no_msa.sh
#         CURRLINE=$(sed '19!d' /blue/pdixit/hodaakl/SH_FILES/AF_Submission_Directory/AF_submit_no_msa.sh)
#         echo "Reading current line in the file is:  ${CURRLINE}"
#         N_JOBS=$(squeue -A pdixit | grep gpu | wc -l)
#         ### get the number of jobs running on gpu 
#         while [ $N_JOBS -gt 8 ]
#         do 
#             sleep 10s 
#             echo "sleeping for 10s"
#             N_JOBS=$(squeue -A pdixit | grep gpu | wc -l)
#         done
#         ### SUBMIIIITTTT the job
#         sbatch /blue/pdixit/hodaakl/SH_FILES/AF_Submission_Directory/AF_submit_no_msa.sh
#         echo "submitted job for natural sequence ${seqnum}"
#         echo
#     done
#     done

# done