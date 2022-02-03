#!/usr/bin/env bash
function sync_history() {
    pushd ./metrics
    last_f=`ls -lt | awk '/history/ {print $NF}'`
    echo "$1${last_f}"
    gsutil -m cp "./${last_f}" "gs://gs_bak/mcflhistory/$1${last_f}"
    rm "./${last_f}"
    popd
}

cd /multi-center-fed-learning
git pull origin rbmcfl
cd /multi-center-fed-learning/models
DATASET="FEMNIST"

echo "****** Experiment to run on Femnist ******"
python experiment.py -dataset femnist -experiment fedavg -configuration job-poison.yaml
FILE="$DATASET-fedavg-poison-"
sync_history "${FILE}"

python experiment.py -dataset femnist -experiment fedrobust -configuration job-poison.yaml
FILE="$DATASET-fedsem-poison-"
sync_history "${FILE}"

python experiment.py -dataset femnist -experiment fedsem -configuration job-poison.yaml
FILE="$DATASET-fedrobust-poison-"
sync_history "${FILE}"
echo "Result copied to storage, job successfully completed. "
