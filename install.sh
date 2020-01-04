#!/bin/bash

snapfile=$(ls -1 ibdfw_*_amd64.snap|sort -V|tail -n 1)
sudo snap install --classic --dangerous $snapfile
#sudo snap install --dangerous $snapfile
