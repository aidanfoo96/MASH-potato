"""
Analyse genomes using MASH, plot differences
Author: Aidan Foo
"""

import pandas as pd

# read sample table as a dataframe
samples_df = pd.read_csv("samples.tsv", sep = "\t")

# conver dataframe to a dictionary with ID as key and filepath as value
samples_dict = dict(zip(samples_df['SampleID'], samples_df['FilePath']))

configfile: "config.yaml"

include: "01_mash_analysis.smk"

rule all:
    input:
        "results/mash_distance.tab"


        