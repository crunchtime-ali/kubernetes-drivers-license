#!/usr/bin/env bash

# Install kubectl
curl -Lo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.18.9/bin/linux/amd64/kubectl
chmod +x /usr/local/bin/kubectl 

# Install kind
curl -Lo /usr/local/bin/kind https://kind.sigs.k8s.io/dl/v0.9.0/kind-linux-amd64
chmod +x /usr/local/bin/kind