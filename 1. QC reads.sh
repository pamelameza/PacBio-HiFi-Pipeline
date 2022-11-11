# Crear carpeta para PYM004

mkdir PYM004
cd PYM004

cp /mnt/Timina/cgonzaga/adiaz/PacBio_secuencias/PYH004/Cell-1/m64140_220326_035307.hifi_reads.fastq.gz .
cp /mnt/Timina/cgonzaga/adiaz/PacBio_secuencias/PYH004/Cell-2/m64140_220327_145016.hifi_reads.fastq.gz .
cp /mnt/Timina/cgonzaga/adiaz/PacBio_secuencias/PYH004/Cell-3/m64140_220329_015043.hifi_reads.fastq.gz .

# Unir los reads en un mismo archivo 

cat *.fastq.gz > PYM004_reads.fastq.gz

# Crear carpeta para PYM005

mkdir PYM005
cd PYM005

ln -s /mnt/Timina/cgonzaga/adiaz/PacBio_secuencias/PYH005/Cell-1/m64140_220221_052429.hifi_reads.fastq.gz .
ln -s /mnt/Timina/cgonzaga/adiaz/PacBio_secuencias/PYH005/Cell-2/m54336U_220304_030949.hifi_reads.fastq.gz .

# Unir los reads en un mismo archivo 

cat *.fastq.gz > PYM005_reads.fastq.gz

# Crear carpeta para PYM006

mkdir PYM006
cd PYM006

ln -s /mnt/Timina/cgonzaga/adiaz/PacBio_secuencias/PYH006/Cell-1/m64140_220222_162230.hifi_reads.fastq.gz . 
ln -s /mnt/Timina/cgonzaga/adiaz/PacBio_secuencias/PYH006/Cell-2/m54336U_220305_140759.hifi_reads.fastq.gz . 

# Unir los reads en un mismo archivo 

cat *.fastq.gz > PYM006_reads.fastq.gz

# Crear carpetas para QC

mkdir 1.ReadsQC_PYM004
cd 1.ReadsQC_PYM004

mkdir 1.ReadsQC_PYM005
cd 1.ReadsQC_PYM005

mkdir 1.ReadsQC_PYM006
cd 1.ReadsQC_PYM006

# Análisis con LongQC

mkdir LongQC_PYM004
cd LongQC_PYM004
ln -s /mnt/Timina/cgonzaga/pmeza/PYH004/PYH004_reads.fastq.gz .
module load anaconda3/2021.05
module load longqc/1.2.0
python /cm/shared/apps/longqc/LongQC-1.2.0/longQC.py sampleqc -x pb-hifi -s PYM004 -p 60 -o LongQC PYM004_reads.fastq.gz

mkdir LongQC_PYM005
cd LongQC_PYM005
ln -s /mnt/Timina/cgonzaga/pmeza/PYM005/PYM005_reads.fastq.gz .
module load anaconda3/2021.05
module load longqc/1.2.0
python /cm/shared/apps/longqc/LongQC-1.2.0/longQC.py sampleqc -x pb-hifi -s PYH005 -p 80 -o LongQC PYM005_reads.fastq.gz

mkdir LongQC_PYM006
cd LongQC_PYM006
ln -s /mnt/Timina/cgonzaga/pmeza/PYM005/PYM005_reads.fastq.gz .
module load anaconda3/2021.05
module load longqc/1.2.0
python /cm/shared/apps/longqc/LongQC-1.2.0/longQC.py sampleqc -x pb-hifi -s PYH006 -p 80 -o LongQC PYM006_reads.fastq.gz

# Análisis de FastQC

mkdir FastQC_PYM004
cd FastQC_PYM004
ln -s /mnt/Timina/cgonzaga/pmeza/PYH004/PYM004_reads.fastq.gz .
module load fastqc/0.11.3
fastqc PYM004_reads.fastq.gz

mkdir FastQC_PYM005
cd FastQC_PYM005
ln -s /mnt/Timina/cgonzaga/pmeza/PYH005/PYM005_reads.fastq.gz .
module load fastqc/0.11.3
fastqc PYM005_reads.fastq.gz

mkdir FastQC_PYM006
cd FastQC_PYM006
ln -s /mnt/Timina/cgonzaga/pmeza/PYH006/PYM006_reads.fastq.gz .
module load fastqc/0.11.3
fastqc PYM006_reads.fastq.gz
