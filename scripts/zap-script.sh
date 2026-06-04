#!/bin/bash

docker pull zaproxy/zap-stable

docker run --rm -v "${GITHUB_WORKSPACE}:/zap/wrk/:rw" -t zaproxy/zap-stable \
  zap-baseline.py -t "https://kenken64.github.io/bitcoin-order-app/" \
  -r /zap/wrk/zap_baseline_report.html -I

if [ ! -f "${GITHUB_WORKSPACE}/zap_baseline_report.html" ]; then
  echo "ZAP report was not generated."
  exit 1
fi

exit 0
