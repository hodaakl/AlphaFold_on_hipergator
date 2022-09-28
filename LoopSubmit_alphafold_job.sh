######
# THIS FILE LOOPS OVER THE DESIRED SEQUENCES AND SUBMITS THEM IN A FOR LOOP -- 
cd directory_where_sequences_Are
for seqnum in {0..999}
do
    sed -i "19s/.*/colabfold_batch --amber Seq_${seqnum}.a3m folder_for_Results" AF_submit_job.sh
    CURRLINE=$(sed '21!d' AF_submit_job.sh)
    echo "Reading current line in the file is:  ${CURRLINE}"
    ### THE FOLLOWING LINES COUNTS HOW MANY JOBS ARE RUNNING ON GPU AND WAITS TO SUBMIT WHEN ONE IS AVAILABLE
    N_JOBS=$(squeue -A your_group_account_name | grep gpu | wc -l)
    ### get the number of jobs running on gpu 
    while [ $N_JOBS -gt 9 ] ## assuming you have 10 gpus to work with , but adjust as suitable
    do 
        sleep 10s 
        echo "sleeping for 10s"
        N_JOBS=$(squeue -A your_group_account_name | grep gpu | wc -l)
    done
    ### SUBMIIIITTTT the job
    sbatch AF_submit_job.sh
    echo "submitted job for natural sequence ${seqnum}"
    echo
done
done