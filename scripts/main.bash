#! /bin/bash

DATASET="femnist"
lr="0.003"
num_rounds="400"
clients_per_round="2"
base_line="fedco"

function run_fedco() {
    num_clusters="$1"
    python fl_main.py --dataset=${DATASET} --num_rounds=${num_rounds} --baseline=${base_line} --clients-per-round=${clients_per_round} --epochs=10 --test_batch=100 --batch-size=10 --lr=${lr} --eval_every=1 --k=${num_clusters} --seed_file=config/random_seed.csv --extra_params_file=../configs/fedrobust/job.yaml    
}

##################### Script #################################
cd /root/leaf/data/femnist
./preprocess.sh -s niid --sf 0.3 -k 30 -t sample --tf 0.8
cd /root/multi-center-fed-learning
git pull origin pfl-test
cd models
echo $(pwd)
echo "Running Training Pipeline......."
run_fedco 2
run_fedco 4
run_fedco 6

gsutil -m cp ./output/* gs://gs_bakcentral/json/

