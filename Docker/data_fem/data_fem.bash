#!/usr/bin/env bash

echo "Transfering data to local..."
mkdir -p ~/leaf/data/femnist/data/test
mkdir -p ~/leaf/data/femnist/data/train
gsutil -m rsync -r gs://gs_bak/leaf/data/femnist/data/test ~/leaf/data/femnist/data/test
gsutil -m rsync -r gs://gs_bak/leaf/data/femnist/data/train ~/leaf/data/femnist/data/train

echo "Finished."
