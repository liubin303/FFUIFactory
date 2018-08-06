#!/usr/bin/env bash

set -eu

HOOK_DIR=$(git rev-parse --show-toplevel)/.git/hooks

ln -s pre-commit.sh $HOOK_DIR/pre-commit