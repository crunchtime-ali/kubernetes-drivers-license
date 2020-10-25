#!/usr/bin/env bash

launch.sh
kubectl create namespace scenario-pods
kubectl config set-context --current --namespace=scenario-pods
alias k=kubectl