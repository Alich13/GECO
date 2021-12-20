library(seqinr)
library(dplyr)
library(ggplot2)
library(reshape)
library(tidyverse)
library("heatmaply")
library("dendextend")


## Show all possible codons:
words()

## Make a coding sequence from this:
(cds <- s2c(paste(words(), collapse = "")))

## Get codon counts:
uco(cds, index = "eff")

## Get codon relative frequencies:
uco(cds, index = "freq")

## Get RSCU values:
uco(cds, index = "rscu")

## Show what happens with ambiguous bases:
uco(s2c("aaannnttt"))

## Use a real coding sequence:
rcds0 <- read.fasta(file = "data/Candidatus_Saccharibacteria_bacterium_RAAC3_TM7_1.fasta")[[1]]
rcds1_1 <- read.fasta(file = "data/Candidatus_Nanosynbacter_lyticus.fasta")[[1]]
rcds1_2 <- read.fasta(file = "data/gengiviticus.fna")[[1]]
rcds2_1 <- read.fasta(file = "data/Candidatus_aalborgenus.fna")[[1]]
rcds2_2 <- read.fasta(file = "data/Candidatus_Babla_genomic.fna")[[1]]


df <- data.frame (
                  Candidatus_Saccharibacteria  = uco( rcds0, index = "rscu"),
                  Nanosynbacter_lyticus = uco( rcds1_1, index = "rscu"),
                  Nanosynbacter_gengiviticus = uco( rcds1_2, index = "rscu"),
                  Candidatus_aalborgenus = uco( rcds2_1, index = "rscu"),
                  Candidatus_Babla = uco( rcds2_2, index = "rscu")
)



# generate heatmap


x=as.matrix(df)
x


col_dend  <- x %>%
  t %>%
  dist %>%
  hclust %>%
  as.dendrogram %>%
  set("branches_k_color", k = 2) %>%
  set("branches_lwd", c(1, 2)) %>%
  ladderize

my_palette=magma(50)
heatmaply(x,
          scale = "none",
          xlab="organism",
          ylab="codon",
          grid_size = 0.4,
          hclust_method="ward.D2",
          show_dendrogram = c(FALSE, TRUE),
          col = my_palette,
          limits = c(0,5),
          Colv = col_dend,
)


