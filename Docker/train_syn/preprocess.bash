#!/usr/bin/env bash

cd /root/leaf/data/synthetic
python main.py -num-tasks 1000 -num-classes 5 -num-dim 60
./preprocess.sh -s niid --sf 1.0 -k 5 -t sample --tf 0.6
