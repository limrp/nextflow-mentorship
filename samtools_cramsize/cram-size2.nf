#!/usr/bin/env nextflow

params.prefix = "sample"
//params.cram_file = Channel.fromPath("*.cram")
prefix_ch = Channel.of(params.prefix)
cram_ch = Channel.fromPath('data/*.cram')

process CRAMSIZE {

  container 'samtools:1.17'

  input:
  //tuple val prefix, path cram 
  //ERROR ~ No such variable: tuple
  tuple val(prefix), path(cram)
  //Process `CRAMSIZE` declares 1 input channel but 2 were specified
  //Solution: join the 2 input channels into 1

  output:
  path("*.size")

  script:
  """
  samtools \\
    cram-size \\
    -ve \\
    -o ${prefix}.size \\
    $cram
    
  """
}

workflow {
    //results_ch = CRAMSIZE(prefix_ch, cram_ch)
    results_ch = CRAMSIZE(prefix_ch.combine(cram_ch))
}