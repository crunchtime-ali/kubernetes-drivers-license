#!/usr/bin/env bash

launch.sh
kubectl create namespace scenario-secrets
kubectl config set-context --current --namespace=scenario-secrets
alias k=kubectl