#!/bin/sh

set -e

go test -coverprofile=coverage.out ./...

rm -rf coverage
mkdir -p coverage

gocov convert coverage.out | gocov-html > coverage/index.html

python3 /usr/local/bin/send_coverage.py
