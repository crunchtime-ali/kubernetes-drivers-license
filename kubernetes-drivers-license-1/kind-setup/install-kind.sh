#!/bin/bash

eval "$(curl -sL https://raw.githubusercontent.com/travis-ci/gimme/master/gimme | GIMME_GO_VERSION=stable bash)" && export PATH=$PATH:$HOME/go/bin
go get -u -v sigs.k8s.io/kind