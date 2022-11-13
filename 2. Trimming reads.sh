# Limpieza y filtrado de reads 

#Hacer carpetas para cada muestra
mkdir 2.ReadsTrimming
cd 2.ReadsTrimming

#PYM004
ln -s /mnt/Timina/cgonzaga/pmeza/PYM004/reads/PYM007_reads.fastq.gz .

module load hifiadapterfilt/2.0.0
module load blast+/2.13.0
module load bamtools/2.5.1
## Nota: opción -p indica el prefix o ruta del archivo (mas no el archivo), es mejor dejar ./ en la carpeta donde tengamos solo el archivo
pbadapterfilt.sh -p ./ -l 44 -m 97 -t 60 -o Hifiadapterfilt_PYM004

#PYM005
ln -s /mnt/Timina/cgonzaga/pmeza/PYM005/reads/PYM005_reads.fastq.gz .

module load hifiadapterfilt/2.0.0
module load blast+/2.13.0
module load bamtools/2.5.1
## Nota: opción -p indica el prefix o ruta del archivo (mas no el archivo), es mejor dejar ./ en la carpeta donde tengamos solo el archivo
pbadapterfilt.sh -p ./ -l 44 -m 97 -t 60 -o Hifiadapterfilt_PYM005

#PYM006
ln -s /mnt/Timina/cgonzaga/pmeza/PYM006/reads/PYM006_reads.fastq.gz .

module load hifiadapterfilt/2.0.0
module load blast+/2.13.0
module load bamtools/2.5.1
## Nota: opción -p indica el prefix o ruta del archivo (mas no el archivo), es mejor dejar ./ en la carpeta donde tengamos solo el archivo
pbadapterfilt.sh -p ./ -l 44 -m 97 -t 60 -o Hifiadapterfilt_PYM006
