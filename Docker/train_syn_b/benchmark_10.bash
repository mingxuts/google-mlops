#!/usr/bin/env bash
function sync_bench() {
    last_f=`ls -lt | awk '/_clustering/ {print $NF}'`
    echo "$1${last_f}"
    gsutil -m cp "./${last_f}" "gs://gs_bak/benchmark/$1${last_f}"
    rm "./${last_f}"
}


cd /multi-center-fed-learning
git pull origin rbmcfl
cd /multi-center-fed-learning/models
echo "****** Benchemark clustering to run on Synthetic ******"

DATASET="SYNTHETIC"
python experiment.py -dataset synthetic -experiment fedsem_benchmark -configuration job-poison.yaml
FILE="$DATASET-"
sync_bench FILE

echo "Training result copied to bucket, job successfully completed. "
