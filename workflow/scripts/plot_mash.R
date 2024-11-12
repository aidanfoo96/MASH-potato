# plot mash results 

library(tidyverse)

mash_results <- read_tsv(snakemake@input[[compare_genomes]])

