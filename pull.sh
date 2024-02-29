#!/bin/sh

public_branch=master-public

git switch $public_branch
git pull --no-rebase --no-ff public master
git switch master
git merge --no-ff $public_branch --allow-unrelated-histories
