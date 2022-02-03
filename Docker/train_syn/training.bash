#!/usr/bin/env bash
function sync_history() {
    pushd ./metrics
    last_f=`ls -lt | awk '/history/ {print $NF}'`
    echo "$1${last_f}"
    gsutil -m cp "./${last_f}" "gs://gs_bak/mcflhistory/$1${last_f}"
    rm "./${last_f}"
    popd
}

echo "****** Experiment to run on Celeba ******"

cd /multi-center-fed-learning
git pull origin rbmcfl
cd /multi-center-fed-learning/models
DATASET="SYNTHETIC"
python experiment.py -dataset synthetic -experiment fedavg
FILE="$DATASET-fedavg-"
sync_history FILE

python experiment.py -dataset synthetic -experiment fedsem
FILE="$DATASET-fedsem-"
sync_history FILE

python experiment.py -dataset synthetic -experiment fedrobust
FILE="$DATASET-fedrobust-"
sync_history FILE
echo "Training result copied to bucket, job successfully completed. "