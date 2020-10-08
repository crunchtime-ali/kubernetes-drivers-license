#!/bin/bash

eval "$(curl -sL https://raw.githubusercontent.com/travis-ci/gimme/master/gimme | GIMME_GO_VERSION=stable bash)" && export PATH=$PATH:$HOME/go/bin
GO111MODULE="on" go get sigs.k8s.io/kind@v0.9.0

