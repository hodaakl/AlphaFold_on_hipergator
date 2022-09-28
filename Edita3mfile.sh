#51	1
K=64
SEQNUM=14012
##### read the line in the fasta file 
# cd /blue/pdixit/hodaakl/A4PSV/StructureAnalysis/BPT1_StructureAnalysis/AF/k${K}
cd /blue/pdixit/hodaakl/A4PSV/StructureAnalysis/BPT1_StructureAnalysis/AF/OG/Sequences
##### copy the a3m file to a a3m file with the name of the sequence
cp /blue/pdixit/hodaakl/SH_FILES/af_nomsa_test_directory/testseq_tav.a3m BPT1_OG_seq${SEQNUM}.a3m
#####
FILENAME=BPT1_OG_seq${SEQNUM}.fasta
CURRLINE=$(sed -n '2p' ${FILENAME})
##### store that line 
sed -i "3s/.*/${CURRLINE}/" BPT1_OG_seq${SEQNUM}.a3m
##### add it to the a3m file 