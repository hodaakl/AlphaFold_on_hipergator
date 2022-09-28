#51	1
# do 
# echo k=$k
for seqnum in {10..14012}
do 
    ### change the Edita3mfile.sh 
    # sed -i "2s/.*/K=${k}/" Edita3mfile.sh
    sed -i "3s/.*/SEQNUM=${seqnum}/" Edita3mfile.sh
    ### run the file 
    ./Edita3mfile.sh
done 
# done