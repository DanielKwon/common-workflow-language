#!/usr/bin/env cwl-runner
class: Workflow
cwlVersion: cwl:draft-3

inputs: []

outputs:
  - id: count_output
    type: int
    source: "#step2/output"

steps:
  - id: step1
    run: wc-tool.cwl
    inputs:
      - id: file1
        default:
          class: File
          path: whale.txt
    outputs:
      - {id: output}

  - id: step2
    run: parseInt-tool.cwl
    inputs:
      - {id: file1, source: "#step1/output"}
    outputs:
      - {id: output}
