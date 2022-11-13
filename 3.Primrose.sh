#Hacer carpetas para cada muestra
mkdir Primrose
cd Primrose

#PYM004

#Crear links dinámicos
ln -s /mnt/Timina/cgonzaga/adiaz/PacBio_secuencias/PYH004/Cell-1/m64140_220326_035307.subreads.bam .
ln -s /mnt/Timina/cgonzaga/adiaz/PacBio_secuencias/PYH004/Cell-2/m64140_220327_145016.subreads.bam .
ln -s /mnt/Timina/cgonzaga/adiaz/PacBio_secuencias/PYH004/Cell-3/m64140_220329_015043.subreads.bam .

#Unir subreads
module load samtools/1.16.1
samtools merge PYM004.subreads.bam m64140_220326_035307.subreads.bam m64140_220327_145016.subreads.bam m64140_220329_015043.subreads.bam

#Agregar kinetics
module load anaconda3/2021.05
source activate pmeza27
ccs PYM004.subreads.bam PYM004.hifi_reads.bam --hifi-kinetics

#Correr en primrose
module load primrose/1.3.0
primrose PYM004.hifi_reads.bam PYM004.5mc.hifi_reads.bam 

#PYM005

#Crear links dinámicos
ln -s /mnt/Timina/cgonzaga/adiaz/PacBio_secuencias/PYH005/Cell-1/m64140_220221_052429.subreads.bam .
ln -s /mnt/Timina/cgonzaga/adiaz/PacBio_secuencias/PYH005/Cell-2/m54336U_220304_030949.subreads.bam .

#Unir subreads
module load samtools/1.16.1
samtools merge PYM005.subreads.bam m64140_220221_052429.subreads.bam m54336U_220304_030949.subreads.bam

#Agregar kinetics
module load anaconda3/2021.05
source activate pmeza27
ccs PYM005.subreads.bam PYM005.hifi_reads.bam --hifi-kinetics

#Correr en primrose
module load primrose/1.3.0
primrose PYM005.hifi_reads.bam PYM005.5mc.hifi_reads.bam

#PYM006

#Crear links dinámicos
ln -s /mnt/Timina/cgonzaga/adiaz/PacBio_secuencias/PYH006/Cell-1/m64140_220222_162230.subreads.bam  .
ln -s /mnt/Timina/cgonzaga/adiaz/PacBio_secuencias/PYH006/Cell-2/m54336U_220305_140759.subreads.bam .

#Unir subreads
module load samtools/1.16.1
samtools merge PYM006.subreads.bam m64140_220222_162230.subreads.bam m54336U_220305_140759.subreads.bam

#Agregar kinetics
module load anaconda3/2021.05
source activate pmeza27
ccs PYM006.subreads.bam PYM006.hifi_reads.bam --hifi-kinetics

#Correr en primrose
module load primrose/1.3.0
primrose PYM006.hifi_reads.bam PYM006.5mc.hifi_reads.bam
