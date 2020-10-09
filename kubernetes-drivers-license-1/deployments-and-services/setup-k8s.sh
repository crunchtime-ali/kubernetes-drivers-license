#!/bin/bash

touch deployment.yaml
touch service.yaml
launch.sh
kubectl config set-context --current --namespace=default
alias k=kubectl