#! /bin/bash

DATASET="synthetic"
lr="0.01"
num_rounds="400"
clients_per_round="5"
base_line="fedco"

function run_fedco() {
    rm ./output/*
    python fl_main.py --dataset=${DATASET} --num_rounds=${num_rounds} --baseline=${base_line} --clients-per-round=${clients_per_round} --epochs=10 --test_batch=100 --batch-size=10 --lr=${lr} --eval_every=1 --k=2 --seed_file=config/random_seed.csv --extra_params_file=../configs/fedrobust/job.yaml    
    bq load --source_format=NEWLINE_DELIMITED_JSON explore.event ./output/event_data.json
    bq load --source_format=NEWLINE_DELIMITED_JSON explore.test_raw ./output/test_data.json
    bq load --source_format=NEWLINE_DELIMITED_JSON explore.ft_raw ./output/ft_data.json
}

##################### Script #################################
cd /root/leaf/data/synthetic
rm -rf data
python main.py -num-tasks 1000 -num-classes 5 -num-dim 60
./preprocess.sh -s niid --sf 1.0 -k 5 -t sample --tf 0.6
cd /root/multi-center-fed-learning
git pull origin pfl-test
cd models
echo $(pwd)
echo "Running Training Pipeline......."
run_fedco 

