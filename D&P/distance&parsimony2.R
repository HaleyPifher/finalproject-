{\rtf1\ansi\ansicpg1252\cocoartf2638
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 D&P 2\
> setwd("Parsimony & distance")\
Error in setwd("Parsimony & distance") : cannot change working directory\
> dna <- fasta2DNAbin(file="finalprojectalignmentdata-2.fasta")\
\
 Converting FASTA alignment into a DNAbin object... \
\
\
 Finding the size of a single genome... \
\
\
 genome size is: 1,228 nucleotides \
\
( 26  lines per genome )\
\
 Importing sequences... \
..........\
 Forming final object... \
\
...done.\
\
> tre.pars <- optim.parsimony(tre.ini, dna2)\
Final p-score 102922 after  0 nni operations \
> plot(tre.pars, cex=0.6)\
> dna <- fasta2DNAbin(file="finalprojectalignmentdata-2.fasta")\
\
 Converting FASTA alignment into a DNAbin object... \
\
\
 Finding the size of a single genome... \
\
\
 genome size is: 1,228 nucleotides \
\
( 26  lines per genome )\
\
 Importing sequences... \
..........\
 Forming final object... \
\
...done.\
\
> dna2 <- as.phyDat(dna)\
>  tre.ini <- nj(dist.dna(dna,model="raw"))\
> tre.ini <- nj(dist.dna(dna,model="raw"))\
> parsimony(tre.ini, dna2)\
[1] 1443\
> tre.pars <- optim.parsimony(tre.ini, dna2)\
Final p-score 1443 after  0 nni operations \
> plot(tre.pars, cex=0.6)\
> D <- dist.dna(dna, model="TN93")\
> D\
                       CP016104.1_1-1320 CP012323.1_1-1320 CP016106.1_1-1320\
CP012323.1_1-1320            0.000000000                                    \
CP016106.1_1-1320            0.005705374       0.005705374                  \
CP012321.1_1-1320            0.005705374       0.005705374       0.000000000\
CP019858.1_1-1320            0.005705374       0.005705374       0.000000000\
AZSH01000015.1               0.005705374       0.005705374       0.000000000\
CP012312.1_2805-3011         0.759268002       0.759268002       0.759268002\
JAGKRT010000023.1            1.431651439       1.431651439       1.520429723\
CP013196.1_39316-39810               NaN               NaN               NaN\
AHJJ01000056.1               1.112726287       1.112726287       1.142451195\
                       CP012321.1_1-1320 CP019858.1_1-1320 AZSH01000015.1\
CP012323.1_1-1320                                                        \
CP016106.1_1-1320                                                        \
CP012321.1_1-1320                                                        \
CP019858.1_1-1320            0.000000000                                 \
AZSH01000015.1               0.000000000       0.000000000               \
CP012312.1_2805-3011         0.759268002       0.759268002    0.759268002\
JAGKRT010000023.1            1.520429723       1.520429723    1.520429723\
CP013196.1_39316-39810               NaN               NaN            NaN\
AHJJ01000056.1               1.142451195       1.142451195    1.142451195\
                       CP012312.1_2805-3011 JAGKRT010000023.1\
CP012323.1_1-1320                                            \
CP016106.1_1-1320                                            \
CP012321.1_1-1320                                            \
CP019858.1_1-1320                                            \
AZSH01000015.1                                               \
CP012312.1_2805-3011                                         \
JAGKRT010000023.1                       NaN                  \
CP013196.1_39316-39810                  NaN       0.697863949\
AHJJ01000056.1                  1.560575414               NaN\
                       CP013196.1_39316-39810\
CP012323.1_1-1320                            \
CP016106.1_1-1320                            \
CP012321.1_1-1320                            \
CP019858.1_1-1320                            \
AZSH01000015.1                               \
CP012312.1_2805-3011                         \
JAGKRT010000023.1                            \
CP013196.1_39316-39810                       \
AHJJ01000056.1                    1.767825834\
> tre <- ladderize(tre)\
> plot(tre, cex=.6)\
> title("Tree finalproject2.")\
Error in file.choose() : file choice cancelled\
> title("Tree 2finalproject.")\
> tre.pars <- optim.parsimony(tre.ini, dna2)\
Final p-score 1443 after  0 nni operations \
> plot(tre.pars, cex=0.6)\
> getwd()\
[1] "/Users/haleypifher/Parsimony & distance"\
> plot(tre.pars, cex=0.6)\
> plot(tre, cex=.6)\
> \
\
3/28/23\
Realized trees were not saved properly as pdfs. Used the following steps to save distance and parsimony trees. Note, orig named my-tree2.pdf was renamed to my-disttree2.pdf once in final project-/D&P folder for organization. \
\
> plot(tre, cex=.6)\
> pdf("my-tree.pdf")\
> plot(tre, cex=.6)\
> dev.off()\
quartz \
     2 \
\
> plot(tre.pars, cex=0.6)\
> pdf("partree2.pdf")\
> plot(tre.pars, cex=.6)\
> dev.off()\
quartz \
     2 }