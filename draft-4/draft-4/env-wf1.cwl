#!/usr/bin/env cwl-runner
class: Workflow
cwlVersion: cwl:draft-4.dev2

inputs:
    in: string

outputs:
    out:
      type: File
      outputSource: step1/out

requirements:
  - class: SubworkflowFeatureRequirement
  - class: EnvVarRequirement
    envDef:
      TEST_ENV: override

steps:
  step1:
    run: env-tool1.cwl
    in:
      in: in
    out: [out]
