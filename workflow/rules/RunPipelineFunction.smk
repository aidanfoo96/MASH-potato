"""
Function to determine which rules to run 
"""

def RunPipeline(wildcards):

    final_input = []

    if config["MASH"]["Activate"] is True:
        final_input.extend(
            [
                "../results/reference.msh",
                "../results/mash_distance.tab"
            ]
        )

    return(final_input)

