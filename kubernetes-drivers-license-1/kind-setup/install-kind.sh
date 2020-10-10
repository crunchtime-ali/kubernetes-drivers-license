#!/bin/bash

# Install kubectl
snap install kubectl --classic

# Install kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.9.0/kind-linux-amd64
chmod +x ./kind
mv kind /usr/local/bin