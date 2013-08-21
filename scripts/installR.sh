#!/bin/bash

### Install R in AWS with UBUNTU
sudo apt-get update
sudo apt-get install r-base

### Got to do a trick since Ubuntu is running an old version of R. So let's get build it from source.
R
install.packages("RJSONIO", repos = "http://www.omegahat.org/R", type = "source")
q()

### Install documentation packages

sudo apt-get install r-base-html r-doc-html

