#!/bin/bash

docker pull zaproxy/zap-stable
docker run --rm -v "$(pwd):/zap/wrk/:rw" -t zaproxy/zap-stable \
  zap-baseline.py -t "https://cryohcells.github.io/bitcoin-order-app/" \
  -r zap_baseline_report.html -l PASS

echo $? > /dev/null
