configfile: "config.yaml"

include: "01_mash_analysis.smk"

rule all:
    input:
        "results/mash_distance.tab"


        