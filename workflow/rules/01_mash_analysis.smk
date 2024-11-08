"""
Analyse genomes using MASH 

"""

def get_genome_inputs(wildcards):
    return samples_dict.values()

rule sketch_genomes: 
    message: "compare input genomes using MASH"
    input: 
        get_genome_inputs
    output: 
        "../results/reference.msh"
    conda: 
        "../envs/mash.yaml"
    log: 
        "logs/MASH/mash_sketch.log"
    threads: 8 
    benchmark:
        "benchmarks/mash_sketch.benchmark.txt"
    shell: 
        "mash sketch {input} -o {output}"

rule compare_genomes: 
    message: "use MASH sketches to compare genomes"
    input: 
        sketch_a = "../results/reference.msh",
        sketch_b = "../results/reference.msh"
    output: 
        "../results/mash_distance.tab"
    conda: 
        "../envs/mash.yaml"
    log: 
        "logs/MASH/mash_compare.log"
    benchmark:
        "benchmarks/mash_compare.benchmarks.txt"
    shell: 
        "mash dist {input.sketch_a} {input.sketch_b} > {output}"

rule plot_mash: 
    message: "plot the MASH results in R"
    input: 
        "../results/mash_distance.tab"
    output:
        "../results/plots/mash_plot.pdf"
    conda:
        "../envs/rstat.yaml"
        