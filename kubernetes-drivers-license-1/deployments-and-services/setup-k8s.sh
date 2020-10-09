#!/bin/bash

launch.sh
kubectl config set-context --current --namespace=default
alias k=kubectl