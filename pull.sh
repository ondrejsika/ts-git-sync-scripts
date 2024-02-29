#!/bin/sh

public_branch=public

git switch $public_branch
git pull public master
git switch master
git merge --no-ff $branch
