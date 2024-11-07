SAMPLES = ["AA010_contigs.fa", "AS011_contigs.fa", "AS013_contigs.fa", "AS031_contigs.fa"]

rule all:
    input:
        "results/mash_distance.tab"

rule sketch_genomes: 
    message: "compare input genomes using MASH"
    input: 
        genomes = expand("genomes/{sample}", sample = SAMPLES)
    output: 
        "results/reference.msh"
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
        
