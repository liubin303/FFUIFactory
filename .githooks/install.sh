#!/usr/bin/env bash

set -eux

msg_color_error='\033[31m'
msg_color_success='\033[32m'
msg_color_warning='\033[33m'
msg_color_none='\033[0m'

function chmod_hooks_scripts
{
    echo "${msg_color_warning}Begin chmod_hooks_scripts ...${msg_color_none} \n"
    for file in $1
    do
        chmod +x "${file}"
    done
    echo "${msg_color_success}chmod_hooks_scripts success ${msg_color_none} \n"
}

function backup_hooks_scripts
{
    echo "${msg_color_warning}Begin backup_hooks_scripts ...${msg_color_none} \n"
    CUR_DIR=$(pwd)
    GIT_DIR=$(git rev-parse --show-toplevel)/.git
    cd $GIT_DIR

    if [ -e $GIT_DIR/hooks.old ]; then
    rm -rf $GIT_DIR/hooks.old
    fi

    if [ -e $GIT_DIR/hooks ]; then
    mv hooks hooks.old
    fi
    
    mkdir hooks
    cd $CUR_DIR 
    echo "${msg_color_success}backup_hooks_scripts success ${msg_color_none} \n"
}

function link_hooks_scripts
{
    echo "${msg_color_warning}Begin link_hooks_scripts ...${msg_color_none} \n"
    CUR_DIR=`pwd`
    HOOK_DIR=$(git rev-parse --show-toplevel)/.git/hooks
    for file in $1
    do
        ln -s $CUR_DIR/$file $HOOK_DIR/$file
        echo "${msg_color_success} ${file} link  to ${HOOK_DIR}/${file} ${msg_color_none} \n"
    done
    echo "${msg_color_success}link_hooks_scripts success ${msg_color_none} \n"
}

#applypatch-msg commit-msg post-applypatch post-checkout post-commit post-merge post-receive pre-applypatch pre-auto-gc pre-commit prepare-commit-msg pre-rebase pre-receive update pre-push
hook_git_commond=pre-commit

chmod_hooks_scripts $hook_git_commond
backup_hooks_scripts
link_hooks_scripts $hook_git_commond