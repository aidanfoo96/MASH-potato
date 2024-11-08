configfile: "config.yaml"

rule all:
    input:
        "results/mash_distance.tab"

rule sketch_genomes: 
    message: "compare input genomes using MASH"
    input: 
        expand("{sample}", sample = config["SAMPLES"].values()) # values exludes the keys in the dictionary
    output: 
        "results/reference.msh"
    threads: 8 
    shell: 
        "mash sketch {input} -o {output}"

rule compare_genomes: 
    message: "use MASH sketches to compare genomes"
    input: 
        sketch_a = "results/reference.msh",
        sketch_b = "results/reference.msh"
    output: 
        "results/mash_distance.tab"
    shell: 
        "mash dist {input.sketch_a} {input.sketch_b} > {output}"
        
