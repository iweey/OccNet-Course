#!/bin/bash

gpu_id=0
while getopts "d:" opt
do
  case $opt in
    d)
      gpu_id=$OPTARG
      ;;
    ?)
      echo "There is unrecognized parameter."
      exit 1
      ;;
  esac
done

echo "Running on the GPU: $gpu_id"

CUDA_VISIBLE_DEVICES=$gpu_id python tools/bevdet/evaluate_pth.py \
configs/bevdet/bevdet-r50-cbgs_trt.py \
checkpoints/pytorch/bevdet-r50-cbgs.pth
