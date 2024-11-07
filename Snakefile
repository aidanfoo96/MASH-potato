rule compare_genomes: 
    message: "compare input genomes using MASH"
    shell: """
    mash sketch genomes/*
    
    """