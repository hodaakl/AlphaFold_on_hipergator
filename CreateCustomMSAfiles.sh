#51	1
for k in {8,16,32,64}
do
    echo $k
    # rm -r /blue/pdixit/hodaakl/A4PSV/StructureAnalysis/BPT1_StructureAnalysis/AF/k$k/Seqs_allz_fixMSA/FixedMSAfiles/
    # sleep 5s 
    mkdir /blue/pdixit/hodaakl/A4PSV/StructureAnalysis/BPT1_StructureAnalysis/AF/k$k/Seqs_allz_fixMSA/FixedMSAfiles/
    cd /blue/pdixit/hodaakl/A4PSV/StructureAnalysis/BPT1_StructureAnalysis/AF/k${k}/Seqs_allz_fixMSA/IndividualSeqs
    for IDX in {0..999}
    do 
        f=Ind_Seq_${IDX}.a3m
    # for f in *.a3m
    # do 
        echo $f
        (cat $f; cat /blue/pdixit/hodaakl/A4PSV/ProteinFamilies/msa_BPT1_unimsa.fa) >> /blue/pdixit/hodaakl/A4PSV/StructureAnalysis/BPT1_StructureAnalysis/AF/k$k/Seqs_allz_fixMSA/FixedMSAfiles/msa_seq_${IDX}.a3m
    done
done
## ADABMDCA
# cd /blue/pdixit/hodaakl/A4PSV/StructureAnalysis/BPT1_StructureAnalysis/AF/AdabmDCA/Sequences/
# for idx in {0..999}
# do 
#     f=Seq_${idx}.a3m
#     (cat $f; cat /blue/pdixit/hodaakl/A4PSV/ProteinFamilies/msa_BPT1_unimsa.fa) >> /blue/pdixit/hodaakl/A4PSV/StructureAnalysis/BPT1_StructureAnalysis/AF/AdabmDCA/Seqs_Fixed_MSA/msa_seq_${idx}.a3m
# done
### VAE
# for k in {2,4,8,16,32,64}
# do
#     echo $k
#     cd /blue/pdixit/hodaakl/A4PSV/StructureAnalysis/BPT1_StructureAnalysis/AF/VAE/k${k}
#     mkdir /blue/pdixit/hodaakl/A4PSV/StructureAnalysis/BPT1_StructureAnalysis/AF/VAE/k${k}/FixedMSAfiles
#     cd /blue/pdixit/hodaakl/A4PSV/StructureAnalysis/BPT1_StructureAnalysis/AF/VAE/k${k}/Sequences
#     for IDX in {0..999}
#     do 
#         f=Seq_${IDX}.a3m
#         # echo $f
#         (cat $f; cat /blue/pdixit/hodaakl/A4PSV/ProteinFamilies/msa_BPT1_unimsa.fa) >> /blue/pdixit/hodaakl/A4PSV/StructureAnalysis/BPT1_StructureAnalysis/AF/VAE/k${k}/FixedMSAfiles/msa_seq_${IDX}.a3m
#     done
# done