



for sample in CL5_NoDox CL5_DoxA CL5_DoxB CL6_NoDox CL6_DoxA CL6_DoxB CL7_DoxA CL7_DoxB CL7_NoDox CL8_DoxA CL8_DoxB CL8_NoDox
do
    /home/software/SNPsplit_v0.2.0/SNPsplit --snp_file /usr/people/bioc1387/Project/mm10/Allele-specific/SNPs_CAST_129S1.mm10.SNPfile --no_sort --paired $sample/${sample}.bam

    samtools view -@ 8 $sample/${sample}.bam -o $sample/${sample}.sam
    samtools view -@ 8 $sample/${sample}.genome1.bam -o $sample/${sample}.genome1.sam
    samtools view -@ 8 $sample/${sample}.genome2.bam -o $sample/${sample}.genome2.sam
    htseq-count -s reverse -t transcript $sample/${sample}.sam ~/Project/mm10/Annotation/archive-2014-05-23-16-05-10/Genes/Genes.For4sU.htseq.gtf > $sample/${sample}.counts
    htseq-count -s reverse -t transcript $sample/${sample}.genome1.sam ~/Project/mm10/Annotation/archive-2014-05-23-16-05-10/Genes/Genes.For4sU.htseq.gtf > $sample/${sample}.genome1.counts
    htseq-count -s reverse -t transcript $sample/${sample}.genome2.sam ~/Project/mm10/Annotation/archive-2014-05-23-16-05-10/Genes/Genes.For4sU.htseq.gtf > $sample/${sample}.genome2.counts
done
