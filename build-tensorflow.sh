#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

set -e
set -x

[ -d "$DIR/tensorflow/venv" ] || python -m venv "$DIR/tensorflow/venv"
source "$DIR/tensorflow/venv/bin/activate"

pip install -U pip six numpy wheel setuptools mock 'future>=0.17.1'
pip install -U keras_applications --no-deps
pip install -U keras_preprocessing --no-deps

[[ -f "$DIR/tensorflow/venv/bin/bazel-2.0.0-linux-x86_64" ]] || ( \
    wget https://github.com/bazelbuild/bazel/releases/download/2.0.0/bazel-2.0.0-linux-x86_64 -O $DIR/tensorflow/venv/bin/bazel-2.0.0-linux-x86_64 && \
    chmod +x "$DIR/tensorflow/venv/bin/bazel-2.0.0-linux-x86_64" && \
    ln -s bazel-2.0.0-linux-x86_64 "$DIR/tensorflow/venv/bin/bazel" \
)

cd "$DIR/tensorflow" && \
    ( yes "" | ./configure ) && \
    bazel-2.0.0-linux-x86_64 build //tensorflow:libtensorflow_cc.so
