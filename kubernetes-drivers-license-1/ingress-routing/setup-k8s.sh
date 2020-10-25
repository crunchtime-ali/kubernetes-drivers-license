#!/bin/bash

launch.sh
kubectl create namespace scenario-ingresses
kubectl config set-context --current --namespace=scenario-ingresses
alias k=kubectl