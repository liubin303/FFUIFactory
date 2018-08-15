#!/usr/bin/env bash

set -eu

function install_hooks_into
{
    DIR=$1
    cd "${DIR}"

    set -e
    mv hooks hooks.old
    set +e
    mkdir hooks
    cd hooks
    for file in applypatch-msg commit-msg post-applypatch post-checkout post-commit post-merge post-receive pre-applypatch pre-auto-gc pre-commit prepare-commit-msg pre-rebase pre-receive update pre-push
    do
        echo "${2}" > "${file}"
        chmod +x "${file}"
    done
}

function chmod_hooks_file
{

}

HOOK_DIR=$(git rev-parse --show-toplevel)/.git/hooks

ln -s pre-commit.sh $HOOK_DIR/pre-commit