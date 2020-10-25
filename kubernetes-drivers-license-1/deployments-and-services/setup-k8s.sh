#!/usr/bin/env bash
touch deployment.yaml
touch service.yaml

launch.sh
kubectl create namespace scenario-deployments
kubectl config set-context --current --namespace=scenario-deployments
alias k=kubectl