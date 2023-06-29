#!/usr/bin/env nextflow

params.prefix = "sample"
//params.cram_file = Channel.fromPath("*.cram")
prefix_ch = Channel.of(params.prefix)
cram_ch = Channel.fromPath('data/*.cram')

process CRAMSIZE {

  container 'samtools:1.17'

  input:
  val prefix, path cram 
  
  output:
  path("*.size")

  script:
  """
  samtools \\
    cram-size \\
    -ve \\
    ${prefix}.size
    $cram
    
  """
}

workflow {
    results_ch = CRAMSIZE(prefix_ch, cram_ch)
}