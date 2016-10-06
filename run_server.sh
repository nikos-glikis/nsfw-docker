#!/usr/bin/env bash
docker run --rm -ti  -p 7981:7981 caffe:cpu  python server.py 7981