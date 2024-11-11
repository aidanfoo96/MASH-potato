"""
Generate genome quality assurance metrics with QUAST 
"""

rule QUAST_screen: 
    message: "generating quality assurance metrics with QUAST"
    input: 
        get_genome_inputs
    output: 
        directory("../results/quast_results")
    conda: 
        "../envs/quast.yaml"
    log:
        "logs/QUAST/quast.log"
    threads: 
        config['QUAST']['Threads']
    benchmark:
        "benchmarks/QUAST_benchmark.txt"    
    params: 
        speed = config['QUAST']['RunFaster']
    shell: 
        "quast -o {output} -t {threads} {input}"