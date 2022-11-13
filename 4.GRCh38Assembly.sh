#Crear carpeta para PYM004
mkdir 4.GRCh38Assembly
cd 4.GRCh38Assembly

#Crear links a los reads y la referencia
ln -s /mnt/Timina/cgonzaga/pmeza/PYM004/3.Primrose/PYM004_5mc.hifi_reads.bam
ln -s /mnt/Timina/cgonzaga/resources/GRCh38.14/Homo_sapiens_GRCh38.p14.noMT.fasta .

# Ensamble con pbmm2
module load miniconda/4.3.1
pbmm2 align --sort -j 80 --preset HIFI --log-level INFO Homo_sapiens_GRCh38.p14.noMT.fasta PYM004_5mc.hifi_reads.bam PYM004_5mc.GRCh38.pbmm2.bam

# Conversión de bam a fasta 
module load samtools/1.10
samtools fasta PYM004_5mc.GRCh38.pbmm2.bam > PYM004_5mc.GRCh38.pbmm2.fasta 

# Estadísticas generales con assembly-stats
module load assembly-stats/1.0.1
assembly-stats PYM004_5mc.GRCh38.pbmm2.fasta > PYM004_5mc.GRCh38.pbmm2.assemblystats

# ****** Análisis de aligned coverage depth con mosdepth 
module load mosdepth/0.3.3 
mosdepth -t 60 -n  PYM004_5mc.GRCh38.pbmm2 PYM004_5mc.GRCh38.pbmm2.bam

module load python38/3.8.3
chmod 777 plot-dist.py
python ./plot-dist.py PYM004_5mc.GRCh38.pbmm2.mosdepth.global.dist.txt

# Consenso del pbmm2 bam 
module load samtools/1.16.1 
samtools consensus -f fasta -o PYM004_5mc.GRCh38.pbmm2.cons.fa -a PYM004_5mc.GRCh38.pbmm2.bam

# Estadísticas generales de consensus con assembly-stats
module load assembly-stats/1.0.1
assembly-stats PYM004_5mc.GRCh38.pbmm2.cons.fa > PYM004_5mc.GRCh38.pbmm2.cons.assemblystats

# Mapear ensamble consenso contra la referencia
module load minimap2/2.24
minimap2 -x asm5 -L --secondary=no -t 60 Homo_sapiens_GRCh38.p14.noMT.fasta PYM004_5mc.GRCh38.pbmm2.cons.fa > PYM004_5mc.GRCh38.cons.mm2.paf

# ****** Dot plot
module load r/4.0.2
chmod 777 pafCoordsDotPlotly.R
./pafCoordsDotPlotly.R -i PYM004_5mc.GRCh38.cons.mm2.paf -o PYM004_5mc.GRCh38 -s -t -l -x

----------------------------------------------

#Ver contigs que mapean con buena calidad 
samtools view -c -q60 PYM004_5mc.GRCh38.cons.mm2.bam


#Crear carpeta para PYM005
mkdir 4.GRCh38Assembly
cd 4.GRCh38Assembly

#Crear links a los reads y la referencia
ln -s /mnt/Timina/cgonzaga/pmeza/PYM005/3.Primrose/PYM005_5mc.hifi_reads.bam
ln -s /mnt/Timina/cgonzaga/resources/GRCh38.14/Homo_sapiens_GRCh38.p14.noMT.fasta .

# Ensamble con pbmm2
module load miniconda/4.3.1
pbmm2 align --sort -j 80 --preset HIFI --log-level INFO Homo_sapiens_GRCh38.p14.noMT.fasta PYM005_5mc.hifi_reads.bam PYM005_5mc.GRCh38.pbmm2.bam

# Conversión de bam a fasta 
module load samtools/1.10
samtools fasta PYM05_5mc.GRCh38.pbmm2.bam > PYM005_5mc.GRCh38.pbmm2.fasta 

# Estadísticas generales con assembly-stats
module load assembly-stats/1.0.1
assembly-stats PYM005_5mc.GRCh38.pbmm2.fasta > PYM005_5mc.GRCh38.pbmm2.assemblystats

# ****** Análisis de aligned coverage depth con mosdepth 
module load mosdepth/0.3.3 
mosdepth -t 60 -n  PYM005_5mc.GRCh38.pbmm2 PYM005_5mc.GRCh38.pbmm2.bam

module load python38/3.8.3
chmod 777 plot-dist.py
python ./plot-dist.py PYM005_5mc.GRCh38.pbmm2.mosdepth.global.dist.txt

# Consenso del pbmm2 bam 
module load samtools/1.16.1 
samtools consensus -f fasta -o PYM005_5mc.GRCh38.pbmm2.cons.fa -a PYM005_5mc.GRCh38.pbmm2.bam

# Estadísticas generales de consensus con assembly-stats
module load assembly-stats/1.0.1
assembly-stats PYM005_5mc.GRCh38.pbmm2.cons.fa > PYM005_5mc.GRCh38.pbmm2.cons.assemblystats

# Mapear ensamble consenso contra la referencia
module load minimap2/2.24
minimap2 -x asm5 -L --secondary=no -t 60 Homo_sapiens_GRCh38.p14.noMT.fasta PYM005_5mc.GRCh38.pbmm2.cons.fa > PYM005_5mc.GRCh38.cons.mm2.paf

# ****** Dot plot
module load r/4.0.2
chmod 777 pafCoordsDotPlotly.R
./pafCoordsDotPlotly.R -i PYM005_5mc.GRCh38.cons.mm2.paf -o PYM005_5mc.GRCh38 -s -t -l -x

----------------------------------------------

#Ver contigs que mapean con buena calidad 
samtools view -c -q60 PYM005_5mc.GRCh38.cons.mm2.bam


#Crear carpeta para PYM006
mkdir 4.GRCh38Assembly
cd 4.GRCh38Assembly

#Crear links a los reads y la referencia
ln -s /mnt/Timina/cgonzaga/pmeza/PYM006/3.Primrose/PYM006_5mc.hifi_reads.bam
ln -s /mnt/Timina/cgonzaga/resources/GRCh38.14/Homo_sapiens_GRCh38.p14.noMT.fasta .

# Ensamble con pbmm2
module load miniconda/4.3.1
pbmm2 align --sort -j 80 --preset HIFI --log-level INFO Homo_sapiens_GRCh38.p14.noMT.fasta PYM006_5mc.hifi_reads.bam PYM006_5mc.GRCh38.pbmm2.bam

# Conversión de bam a fasta 
module load samtools/1.10
samtools fasta PYM006_5mc.GRCh38.pbmm2.bam > PYM006_5mc.GRCh38.pbmm2.fasta 

# Estadísticas generales con assembly-stats
module load assembly-stats/1.0.1
assembly-stats PYM006_5mc.GRCh38.pbmm2.fasta > PYM006_5mc.GRCh38.pbmm2.assemblystats

# ****** Análisis de aligned coverage depth con mosdepth 
module load mosdepth/0.3.3 
mosdepth -t 60 -n  PYM006_5mc.GRCh38.pbmm2 PYM006_5mc.GRCh38.pbmm2.bam

module load python38/3.8.3
chmod 777 plot-dist.py
python ./plot-dist.py PYM006_5mc.GRCh38.pbmm2.mosdepth.global.dist.txt

# Consenso del pbmm2 bam 
module load samtools/1.16.1 
samtools consensus -f fasta -o PYM006_5mc.GRCh38.pbmm2.cons.fa -a PYM006_5mc.GRCh38.pbmm2.bam

# Estadísticas generales de consensus con assembly-stats
module load assembly-stats/1.0.1
assembly-stats PYM006_5mc.GRCh38.pbmm2.cons.fa > PYM006_5mc.GRCh38.pbmm2.cons.assemblystats

# Mapear ensamble consenso contra la referencia
module load minimap2/2.24
minimap2 -x asm5 -L --secondary=no -t 60 Homo_sapiens_GRCh38.p14.noMT.fasta PYM006_5mc.GRCh38.pbmm2.cons.fa > PYM006_5mc.GRCh38.cons.mm2.paf

# ****** Dot plot
module load r/4.0.2
chmod 777 pafCoordsDotPlotly.R
./pafCoordsDotPlotly.R -i PYM006_5mc.GRCh38.cons.mm2.paf -o PYM006_5mc.GRCh38 -s -t -l -x

----------------------------------------------

#Ver contigs que mapean con buena calidad 
samtools view -c -q60 PYM006_5mc.GRCh38.cons.mm2.bam
