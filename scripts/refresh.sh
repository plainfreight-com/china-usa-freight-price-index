#!/usr/bin/env bash
# Pull the current published index into data/, named by the date it was priced.
set -euo pipefail
cd "$(dirname "$0")/.."
BASE="https://plainfreight.com/data"
DATE=$(curl -s "$BASE/china-usa-shipping-price-index.json" | python3 -c "import sys,json;print(json.load(sys.stdin)['priced_on'])")
curl -s "$BASE/china-usa-shipping-price-index.csv"  -o "data/price-index-$DATE.csv"
curl -s "$BASE/china-usa-shipping-price-index.json" -o "data/price-index-$DATE.json"
curl -s "$BASE/chargeable-weight-china-usa.csv"     -o "data/chargeable-weight-$DATE.csv"
echo "wrote data/*-$DATE.*"
