#Preparar el ambiente
#Hacer copias de los archivos
mkdir 7.SNVcallingT2T
cd 7.SNVcallingT2T 
cp /mnt/Timina/cgonzaga/resources/T2T_2.0/chm13v2.0.noMT.fa .
cp /mnt/Timina/cgonzaga/resources/T2T_2.0/chm13v2.0.noMT.fa.fai .
cp /mnt/Timina/cgonzaga/pmeza/PYM004/5.T2TAssembly/PYM004_5mc.T2T.pbmm2.bam .
cp /mnt/Timina/cgonzaga/pmeza/PYM004/5.T2TAssembly/PYM004_5mc.T2T.pbmm2.bam.bai .
cp /mnt/Timina/cgonzaga/pmeza/PYM005/5.T2TAssembly/PYM005_5mc.T2T.pbmm2.bam .
cp /mnt/Timina/cgonzaga/pmeza/PYM005/5.T2TAssembly/PYM005_5mc.T2T.pbmm2.bam.bai .
cp /mnt/Timina/cgonzaga/pmeza/PYM006/5.T2TAssembly/PYM006_5mc.T2T.pbmm2.bam .
cp /mnt/Timina/cgonzaga/pmeza/PYM006/5.T2TAssembly/PYM006_5mc.T2T.pbmm2.bam.bai .

#Correr DeepTrio
module load singularity/3.7.0
singularity run \
  -B /cm/shared/apps/singularity/images/3.7.0/deepvariant_deeptrio-1.4.0.sif \
  -B /usr/lib/locale/:/usr/lib/locale/ \
  -B /mnt/Timina/cgonzaga/pmeza/SNVcallingT2T \
  docker://google/deepvariant:deeptrio-1.4.0 \
  /opt/deepvariant/bin/deeptrio/run_deeptrio \
  --model_type PACBIO \
  --ref /mnt/Timina/cgonzaga/pmeza/SNVcallingT2T/chm13v2.0.noMT.fa \
  --reads_child /mnt/Timina/cgonzaga/pmeza/SNVcallingT2T/PYM004_5mc.T2T.pbmm2.bam \
  --reads_parent1 /mnt/Timina/cgonzaga/pmeza/SNVcallingT2T/PYM005_5mc.T2T.pbmm2.bam \
  --reads_parent2 /mnt/Timina/cgonzaga/pmeza/SNVcallingT2T/PYM006_5mc.T2T.pbmm2.bam \
  --output_vcf_child /mnt/Timina/cgonzaga/pmeza/SNVcallingT2T/PYM004_T2T_deeptrio.vcf.gz \
  --output_vcf_parent1 /mnt/Timina/cgonzaga/pmeza/SNVcallingT2T/PYM005_T2T_deeptrio.vcf.gz \
  --output_vcf_parent2 /mnt/Timina/cgonzaga/pmeza/SNVcallingT2T/PYM006_T2T_deeptrio.vcf.gz \
  --sample_name_child ‘PYM004’ \
  --sample_name_parent1 ‘PYM005’ \
  --sample_name_parent2 ‘PYM006’ \
  --num_shards 40 \
