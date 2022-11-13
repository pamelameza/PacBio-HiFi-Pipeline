#Preparar el ambiente
#Hacer copias de los archivos
mkdir 6.SNVcallingGRCh38
cd 6.SNVcallingGRCh38 
cp /mnt/Timina/cgonzaga/resources/GRCh38.14/Homo_sapiens_GRCh38.p14.noMT.fasta . 
cp /mnt/Timina/cgonzaga/resources/GRCh38.14/Homo_sapiens_GRCh38.p14.noMT.fasta.fai .
cp /mnt/Timina/cgonzaga/pmeza/PYM004/4.GRCh38Assembly/PYM004_5mc.GRCh38.pbmm2.bam .
cp /mnt/Timina/cgonzaga/pmeza/PYM004/4.GRCh38Assembly/PYM004_5mc.GRCh38.pbmm2.bam.bai .
cp /mnt/Timina/cgonzaga/pmeza/PYM005/4.GRCh38Assembly/PYM005_5mc.GRCh38.pbmm2.bam .
cp /mnt/Timina/cgonzaga/pmeza/PYM005/4.GRCh38Assembly/PYM005_5mc.GRCh38.pbmm2.bam.bai .
cp /mnt/Timina/cgonzaga/pmeza/PYM006/4.GRCh38Assembly/PYM006_5mc.GRCh38.pbmm2.bam .
cp /mnt/Timina/cgonzaga/pmeza/PYM006/4.GRCh38Assembly/PYM006_5mc.GRCh38.pbmm2.bam.bai .

#Correr DeepTrio
module load singularity/3.7.0
singularity run \
  -B /cm/shared/apps/singularity/images/3.7.0/deepvariant_deeptrio-1.4.0.sif \
  -B /usr/lib/locale/:/usr/lib/locale/ \
  -B /mnt/Timina/cgonzaga/pmeza/SNVcallingGRCh38 \
  docker://google/deepvariant:deeptrio-1.4.0 \
  /opt/deepvariant/bin/deeptrio/run_deeptrio \
  --model_type PACBIO \
  --ref /mnt/Timina/cgonzaga/pmeza/SNVcallingGRCh38/Homo_sapiens_GRCh38.p14.noMT.fasta \
  --reads_child /mnt/Timina/cgonzaga/pmeza/SNVcallingGRCh38/PYM004_5mc.GRCh38.pbmm2.bam \
  --reads_parent1 /mnt/Timina/cgonzaga/pmeza/SNVcallingGRCh38/PYM005_5mc.GRCh38.pbmm2.bam \
  --reads_parent2 /mnt/Timina/cgonzaga/pmeza/SNVcallingGRCh38/PYM006_5mc.GRCh38.pbmm2.bam \
  --output_vcf_child /mnt/Timina/cgonzaga/pmeza/SNVcallingGRCh38/PYM004_GRCh38_deeptrio.vcf.gz \
  --output_vcf_parent1 /mnt/Timina/cgonzaga/pmeza/SNVcallingGRCh38/PYM005_GRCh38_deeptrio.vcf.gz \
  --output_vcf_parent2 /mnt/Timina/cgonzaga/pmeza/SNVcallingGRCh38/PYM006_GRCh38_deeptrio.vcf.gz \
  --sample_name_child ‘PYM004’ \
  --sample_name_parent1 ‘PYM005’ \
  --sample_name_parent2 ‘PYM006’ \
  --num_shards 40 \
