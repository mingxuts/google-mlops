#!/usr/bin/env bash

echo "Transfering data to local..."
mkdir -p ~/leaf/data/celeba/data/raw
mkdir -p ~/leaf/data/celeba/data/test
mkdir -p ~/leaf/data/celeba/data/train
gsutil -m rsync -r gs://gs_bak/leaf/data/celeba/data/raw ~/leaf/data/celeba/data/raw
gsutil -m rsync -r gs://gs_bak/leaf/data/celeba/data/test ~/leaf/data/celeba/data/test
gsutil -m rsync -r gs://gs_bak/leaf/data/celeba/data/train ~/leaf/data/celeba/data/train

echo "Transfer done"
