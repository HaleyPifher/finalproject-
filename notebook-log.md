# *Description*
Data on 10 strains of non toxigenic C. difficile with a focus on strain CCUG37785 

-Link to original paper: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9045287/#B21 (data used can be found in table 1) 

-whole genomes sourced from GenBank

-reads already assessed using FastQC

-Study relevant to data showed that CCUG37785 spores inoculated orally in mice provided almost full protection against a virulent strain. 

# *Alignment Methods* 
## 1)ClustalW
### Software Description 
ClustalW makes improvements to the progressive multiple alignment method which greatly improve the sensitivity without sacrificing any of the speed and efficiency. ClustalW uses the NJ algorithm by default, but UPGMA can be used for more efficient tree production. The default was used in generating the alignment for this project. 

Method: (i) all pairs of sequences are aligned separately in order to calculate a distance matrix giving the divergence of each pair of sequences; (ii) a guide tree is calculated from the distance matrix; (iii) the sequences are progressively aligned according to the branching order in the guide tree. 
### Strengths & Weaknesses 
In cases where all of the sequences in a data set are very similar (e.g. no pair less than 35% identical), CLUSTAL W will find an alignment which is difficult to improve by eye. In this sense, the alignment is optimal with regard to the alternative of manual
alignment.

Use of different weight matrices as the alignment progresses by-passes the problem of initial choice of weight matrix.

Long processing time  

As more divergent sequences are included, it becomes increasingly difficult to find good alignments and to evaluate them. What we find with CLUSTAL W is that the basic block-like structure of the alignment (corresponding to the major secondary structure elements) is usually recovered, with some of the most divergent sequences misaligned in small regions. This is a very useful starting point for manual refinement, as it helps define the major blocks of similarity. 
### User Choice
In deciding which sequences to align for sequences: CCUG37785, CD37, 5.3 they varied greatly in size(bp), so I found the average of each sequence and then used the following formula in excel to identify the closest size to the average: =INDEX(A2:A28,MATCH(MIN(ABS(D2:D28-D29)),ABS(D2:D28-D29),0)). This was not possible for every sequence because some files were simply too large and not easily transferrable. For sequences: Z31, DS28666, DSM29637, DSM29688, DSM28670, DSM29629, and DSM28669 I randomly selected a sequence to align. *All sequences represent whole genomes for the various strains.* All 10 sequences were then placed in a fasta file and added to the clustalw downloaded software folder. 

Refer to my ClustalW terminal output file for step by step of how the alignment was completed.
### References
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC308517/pdf/nar00046-0131.pdf

http://www.clustal.org/download/clustalw_help.txt

https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9045287/#B21
### Commands used 
Download clustalw-2.1-macosx
'[conda install -c bioconda clustalw](http://www.clustal.org/download/current/)'

*make sure file is fasta format 

Run the program using:
'clustalw -ALIGN -INFILE=finalprojectalignmentdata.fasta -OUTFILE=finalprojectalignmentdata.fasta -OUTPUT=FASTA'

## 2)Muscle
### Software Description 
Following guide tree construction, the fundamental step is pairwise profile alignment, which is used first for progressive alignment and then for refinement. MUSCLE uses two distance measures for a pair of sequences: a k mer distance (for an unaligned pair) and the Kimura distance (for an aligned pair). 
Figure that describes process visually can be found at https://academic.oup.com/view-large/figure/38266783/gkh340f2.jpeg 
### Strengths & Weaknesses
Fast distance estimation using k mers (espec for large sequences)
Compared to other methods (CLUSTALW, T-Coffee, and MAFFT) has average accuracy and high speed for large numbers of sequences 
UPGMA over Neighbor Joining (NJ) is used to build tree because it provides better accuracy at each node by aligning 2 profiles with the fewest differences even if they aren’t evolutionary neighbors.
Lack of statistically significant results in paper (linked in references) ex. Muscle-p (time + space complexity, no refinement included) results are not statistically significant compared to T-Coffee and NWNSI
Stage I of the process emphasizes speed over accuracy 
### User Choice 
Same user choices as described above under alignment method 1 (ClustalW). Additinally, I ran into an error/bug with muscle   "*** ERROR ***  MSA::GetLetter(0/1, 152/24551)=" this was fixed by running the folloing commands: 
*** ERROR ***  MSA::GetLetter(0/1, 2974/115365)='

(base) MacBook-Pro-2:muscle2 haleypifher$ 

(base) MacBook-Pro-2:muscle2 haleypifher$ ls

finalprojectalignmentdata.fasta	muscle3.8.31_i86darwin64	muscle3.8.31_i86darwin64.tar.gz

(base) MacBook-Pro-2:muscle2 haleypifher$ grep "'" finalprojectalignmentdata.fasta 

(base) MacBook-Pro-2:muscle2 haleypifher$ less finalprojectalignmentdata.fasta 

(base) MacBook-Pro-2:muscle2 haleypifher$ ./muscle3.8.31_i86darwin64 

After fixing this error Muscle was ran again but another error appeared: *** ERROR ***  MSA::GetLetter(0/1, 1320/85188)='I'/4294967295 (3/2/23). Instead of trying to correct for this error by using the same fasta file it was determined creating a new one after using TrimAI to remove poorly aligned sequences would be best. Then Muscle was ran again without error. 
### References 
https://academic.oup.com/nar/article/32/5/1792/2380623?login=false

https://www.drive5.com/muscle/manual/msa_getletter_bug.html
### Commands used 
Download Muscle version 3 for Macos
(https://drive5.com/muscle5/)

make the i86darwin64 file exexcutable and use as a program
chmod +x muscle3.8.31_i86darwin64

run the program (./ specifies the current directory) 
(base) MacBook-Pro-2:muscle2 haleypifher$ ./muscle3.8.31_i86darwin64 -in finalprojectalignmentdata.fasta -out finalprojectalingmentdata-aligned-muscle.fasta
# *Distance and Parsimony Methods*
## 1) R Package - ape for distance-based tree estimation method
### Software Description 
ape is a package written in R for the analysis of phylogenetics and evolution. Functions for reading, writing, plotting, and manipulating phylogenetic trees, analyses of comparative data in a phylogenetic framework, ancestral character analyses, analyses of diversification and macroevolution, computing distances from DNA sequences, reading and writing nucleotide sequences as well as importing from BioConductor, and several tools such as Mantel's test, generalized skyline plots, graphical exploration of phylogenetic data (alex, trex, kronoviz), estimation of absolute evolutionary rates and clock-like trees using mean path lengths and penalized likelihood, dating trees with non-contemporaneous sequences, translating DNA into AA sequences, and assessing sequence alignments. Phylogeny estimation can be done with the NJ, BIONJ, ME, MVR, SDM, and triangle methods, and several methods handling incomplete distance matrices (NJ*, BIONJ*, MVR*, and the corresponding triangle method). 

I created a tree using the classical Neighbor-Joining (NJ) algorithm. 
### Strengths & Weaknesses 
can use the Tamura and Nei 1993 model which allows for different rates of transitions and transversions, heterogeneous base frequencies, and between-site variation of the substitution rate. 

phylogeny estimation can completed with a variety of methods 

R has the ability to match different datasets using labels (names, rownames and colnames), and ape uses this feature to match trees, sequences and other data. 

users can face practical difficulties that prevent efficient analysis 
### User Choice 
In creating tree ran into the following error message: "Error in njs(D) : distance information insufficient to construct a tree, cannot calculate agglomeration criterion." To correct it I refered to page 115 of package 'ape' documentation which has the following note: "If the sequences are very different, most evolutionary distances are undefined and a non-finite value (Inf or NaN) is returned. You may do dist.dna(, model = "raw") to check whether some values are higher than 0.75." None of my distance values were equal to or >.75, but changing the model from TN93 to raw did allow me to create a tree. 
### References 
https://cran.r-project.org/web/packages/ape/ape.pdf

http://ape-package.ird.fr/

https://academic.oup.com/bioinformatics/article/35/3/526/5055127
### Commands used
first, download R (version 4.2.2 for Macos)

Install package 
install.packages("adegenet", dep=TRUE)

check the downloaded libraries 
library(ape)
library(adegenet)

Make sure you're in the right folder/directory 
 setwd("Parsimony & distance")\
 
 Load data 
 > dna <- fasta2DNAbin(file="finalprojectalignmentdata-2.fasta")\

Compute the genetic distances using the TN93 model (*note under user choice section had error in the 1st and 2nd runs, but in running 3rd time able to apply the TN93 model as described here)
D <- dist.dna(dna, model="TN93")

Root the tree on an outgroup 
dist3treroot=root(tre, outgroup="CP013196.1_39316-39810")

open new pdf file
 pdf("dist3treroot.pdf")
 
 plot the file 
 plot(dist3treroot, cex=.6)
 
 close and save the pdf
 > dev.off()
pdf 
  3  
## 2) R package - phangron 
### Software Description 
phangron is a package for phylogenetic reconstruction and analysis in R. It now offers the possibility of reconstructing phylogenies with distance based methods, maximum parsimony or maximum likelihood (ML) and performing Hadamard conjugation. Extending the general ML framework, this package provides the possibility of estimating mixture and partition models. Furthermore, phangorn offers several functions for comparing trees, phylogenetic models or splits, simulating character data and performing congruence analyses.

I created a tree using the maximum parsimony (MP) method. MP is an optimality criterion for which the preferred tree is the tree that requires the least changes to explain some data. 

### Strengths & Weaknesses 
allows for search and comparison to find the better tree 

parsimony methods have been shown to produce inconsistent trees
### User Choice 
The maximum parsimony method was used to construct the tree.
### Refrences 
https://academic.oup.com/bioinformatics/article/27/4/592/198887
### Commands used 
Install package (could install initially before running distance, just goes with this step) 
install.packages("phangorn", dep=TRUE)

check the downloaded libraries 
library(ape)
library(adegenet)
library(phangorn)

(data already loaded from distance method)

find starting tree
tre.ini <- nj(dist.dna(dna,model="raw"))

search tree for maximum parsimony 
tre.pars <- optim.parsimony(tre.ini, dna2)
Final p-score 1443 after  0 nni operations 

Root the tree on an outgroup 
pars3treroot=root(tre.pars, outgroup="CP013196.1_39316-39810")

open new pdf file
pdf("pars3treeroot.pdf")

plot the file 
plot(pars3treeroot.pdf, cex=.6)

close and save the pdf
dev.off()
pdf 
  2 
# *Maximum Liklihood*
## 1)RAXML
### Software Description 
RAxML (Randomized Axelerated Maximum Likelihood) is a popular program for phylogenetic analysis of large datasets under maximum likelihood. 
RAxML-NG, a from-scratch re-implementation of the established greedy tree search algorithm of RAxML/ExaML. Uses Subtree Pruning and Regrafting (SPR) moves to quickly navigate to the best known ML tree.
### Strengths & Weaknesses 
Employs a two-step L-BFGS-B method in replacement of the Brent’s method: allowing for increased speed & stability 

Can compute the novel branch support metric called transfer bootstrap expectation (TBE). Making it less sensitive to individual misplaced taxa in replicate trees, better suited to reveal well-supported deep splits in large trees with thousands of taxa when compared to classic felsenstein bootstrap

Optimized the vectorized likelihood computation kernels and eliminated known sequential bottlenecks of RAxML

can be applied to large datasets 

Offers standard statistical significant tests and options to compute Robinson-Foulds distances

Informs phylogenetic terraces (presence and size) 

Best scoring tree overall (1.3 - 4.5 X faster)

Less accurate than IQ-Tree in tree inference 

Has higher variance of trees and can be less stable than IQ-Tree 
### Main Assumptions 
Mutation process is the same at every branch of the tree

All sites evolve independently of each other 

All sites evolve the same 
### User Choice 
RAxML-NG v1.1 (c) 2021 is the version used as it is most up to date.
RAxML produced an unrooted tree, so R was used to root the best tree created by RAxML. An error message occured when trying to root with an outgroup, so instead the middpoint method was used. (Error message and commands used can be found in the Max Liklihood text file within this repo)
To root the tree the following commands were used: 

`pdf("bestroot2.pdf")

> plot(besttrerooot, cex=.6)

> dev.off()

quartz 

     2` 
### Refrences 

https://rdrr.io/cran/phangorn/man/midpoint.html (midpoint command) 

https://docs.google.com/presentation/d/1uIxM9OfsUO0-SW956TVpfipfVms5bdesJ9YbOfhIUPs/edit#slide=id.g2098f609670_0_0 (group presentation) 

https://academic.oup.com/bioinformatics/article/35/21/4453/5487384?login=false (paper on software)

https://academic.oup.com/bioinformatics/article/30/9/1312/238053?login=false (paper on software)

https://towardsdatascience.com/the-kernel-trick-c98cdbcaeb3f (extra)

https://cran.r-project.org/web/packages/TreeTools/vignettes/load-trees.html (used to root in R)
### Commands used 
Download RAxML 
(https://github.com/amkozlov/raxml-ng)

clone the ng-tutorial (for data sets and scripts)
git clone (https://github.com/amkozlov/ng-tutorial.git)


check for the MSA 
(base) MacBook-Pro-2:raxml-ng_v1.1.0_macos_x86_64 haleypifher$ ./raxml-ng --check --msa finalprojectalignmentdata-out.fasta 2 --model GTR+G

Infer the ML tree
(base) MacBook-Pro-2:raxml-ng_v1.1.0_macos_x86_64 haleypifher$ ./raxml-ng --msa finalprojectalignmentdata-out.fasta.raxml.reduced.phy --model GTR+G --prefix T3-myseed --threads 2 --seed 3162021
# *Bayesian Inference*
## Mr.Bayes
### Software Description 
Mr.Bayes performs Bayesian inference using a variant of Markov chain Monte Carlo. MRBAYES uses Markov chain Monte Carlo (MCMC) to approximate the posterior probabilities of trees. MCMC is a method for taking valid, albeit dependent, samples from the probability distribution of interest (in this case, the posterior probabilities of phylogenetic trees. The basic MCMC algorithm works as follows: first, a new state for the chain is proposed using a stochastic mechanism. Second, the acceptance probability for this new state is calculated. The acceptance probability is equal to the minimum of one or the likelihood ratio times, the prior ratio times, the proposal ratio, where the likelihood ratio is the ratio of the likelihoods of the new state to the old state, the prior ratio is the ratio of the prior probability of the new state to the old state, and the proposal ratio is the ratio of the probability of proposing the old state to the probability of proposing the new state. Third, a uniform (0, 1) random variable is drawn. If this number is less than the acceptance probability, then the new state is accepted and the state of the chain is updated. Otherwise the chain remains in the old state. This process of proposing and accepting/rejecting new states is repeated many thousands or millions of times. The proportion of the time any single tree is visited during the course of the chain is a valid approximation of its posterior probability.
### Strengths & Weaknesses 
easy interpretation of results

the ability to incorporate prior information

some computational advantages

command-line interface

MCMC can take a long time to run because huge tree size, low acceptance of moves unless small neighborhood, small effective sample size 

*note to self: ask about variances and cliffs analogy and how its a disadvantage* 

program can infer ancestral states while accommodating uncertainty about the phylogenetic tree and model parameters
### Main Assumptions 
uses posterior probability of the ith phylogenetic tree (τi ) conditional on an alignment of DNA sequences (X) can be calculated using Bayes theorem
approximates the posterior probabilities of trees 
### User Choice 
specify priors (beta(10,10) for kappa), assumptions of subsitution model, and outgroup
I chose to not specify an outgroup as with maximum liklihood it also did not make sense, the taxa are all very similar on a timescale/interms of genome. 
used Emacs not text edit (on mac text edit adds random lines of unrelated text that Mr.Bayes can't read and returns an error)
### Refrences 
https://academic.oup.com/bioinformatics/article/17/8/754/235132?login=false

Course slides: Lecture 12 Bayesian Inference
### Commands used 
Download the software for Macos 
(http://nbisweden.github.io/MrBayes/)

Git clone the files
(base) MacBook-Pro-2:~ haleypifher$  git clone --depth=1 https://github.com/NBISweden/MrBayes.git

Make sure data is in Nexus format 

create a mrbayes block text file *using the priors and changes explained above as well as defaults: 
begin mrbayes;
 set autoclose=yes;
 prset brlenspr=unconstrained:exp(10.0);
 prset shapepr=exp(1.0);
 prset tratiopr=beta(10.0,10.0);
 prset statefreqpr=dirichlet(1.0,1.0,1.0,1.0);
 lset nst=2 rates=gamma ngammacat=4;
 mcmcp ngen=100000 samplefreq=10 printfreq=100 nruns=1 nchains=3 savebrlens=yes;
 mcmc;
 sumt;
end;

Append the MrBayes block to the nexus file 
(base) MacBook-Pro-2:MrBayes haleypifher$ cat finalprojectalignmentdata-out.fasta2.nex Mrbblocko.txt > finalprojectalignmentdata-out.nex

Run MrBayes 
(base) MacBook-Pro-2:MrBayes haleypifher$ mb finalprojectalignmentdata-out.fasta2.nex
# *Coalescent*
## ASTRAL
### Software Description 
ASTRAL is a method for reconstructing species trees after inferring a set of gene trees and is increasingly used in phylogenomic analyses. It is statistically consistent under the multi-species coalescent
model, is scalable, and has shown high accuracy in simulated and empirical studies.
### Strengths & Weaknesses 
consistent under any model for which the quartet that matches the species tree is expected to occur with the highest frequency

statistically inconsistent under models of gene evolution that include gene flow.

scalable 

All versions of ASTRAL give a statistically consistent estimator of the species tree if input gene trees are sampled randomly under the multi-species coalescent model (i.e., with no gene tree error, no sampling bias, and no model violations)

ASTRAL can be statistically inconsistent under certain conditions when gene trees evolve on a phylogenetic network (thus, with a combination of ILS and gene flow)

the number of genes required by the exact version of ASTRAL to compute the correct species tree with high probability grows quadratically with the inverse of the shortest branch length and grows logarithmically with the number of species

accuracy of ASTRAL has compared favorably to alternative ILS-based summary methods such as NJst, ASTRID, MP-EST, wQMC, as well as consensus and supertree methods such as greedy consensus, MulRF, and MRP

Improved running time with new versions 

 ASTRAL limits the search space (unless run with -x), it is possible that other trees with better quartet scores exist
### Main Assumptions 
 ASTRAL CU branch lengths, however, suffer from two issues, which limit their usability in practice. An obvious shortcoming is that terminal branches for
single-individual species lack an estimated length, limiting the utility of the computed branch lengths. The second difficulty is the lack of robustness to gene tree error. Gene tree error tends to increase gene tree discordance; as ASTRAL branch lengths are only a function of discordance (and nothing else), gene tree error results in under-estimation of branch lengths. 

locality: in computing the support for a branch, we assume that all four branches around it are correct, enabling us to only consider three rearrangements around the branch
### User Choice
Chose to not use on project data and instead run single genomes on Mr.Bayes and compare gene trees. Interested in similar genes shared betweeen genomes.
### Refrences 
https://arxiv.org/pdf/1904.03826.pdf

https://github.com/smirarab/ASTRAL/blob/master/README.md#installation 

https://github.com/smirarab/ASTRAL/blob/master/astral-tutorial.md#installation

Course slides: Lecture 14 coalescent-based methods 
### Commands that would have been Used 
Run the program
 java -jar astral.5.7.8.jar -i in.tree -o out.tre 2>out.log
