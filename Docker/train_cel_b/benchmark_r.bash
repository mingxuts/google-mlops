#!/usr/bin/env bash
function sync_bench() {
    last_f=`ls -lt | awk '/_clustering/ {print $NF}'`
    echo "$1${last_f}"
    gsutil -m cp "./${last_f}" "gs://gs_bak/benchmark/$1${last_f}"
    rm "./${last_f}"
}

DATASET="celeba"
cd /multi-center-fed-learning
git pull origin rbmcfl
cd /multi-center-fed-learning/models
echo "****** Benchemark clustering to run on ${DATASET} ******"

python experiment.py -dataset "$DATASET" -experiment fedrobust_benchmark -configuration job-poison.yaml
FILE="$DATASET-"
sync_bench "${FILE}"
