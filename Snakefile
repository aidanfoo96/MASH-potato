rule compare_genomes: 
    message: "compare input genomes using MASH"
    output: 
        "results/reference.msh"
    shell: 
        "mash sketch genomes/* > {output}"