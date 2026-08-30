FROM golang:1.26

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libpam0g-dev \
        python3 \
        python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN GOBIN=/usr/local/bin \
    go install github.com/matm/gocov-html/cmd/gocov-html@v1.4.0 \
    && GOBIN=/usr/local/bin \
    go install github.com/axw/gocov/gocov@v1.1.0

RUN pip3 install \
    --no-cache-dir \
    --break-system-packages \
    aio-send-dir==0.1.6

ENV GOCACHE=/tmp/go-build
ENV GOPATH=/tmp/go


COPY coverage.sh /usr/local/bin/coverage

RUN chmod +x /usr/local/bin/coverage

ENTRYPOINT ["coverage"]
