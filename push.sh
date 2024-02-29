#!/bin/sh

public_branch=master-public
patch_branch=master-public-patch-$(date +%s)

# Construct the command to exclude files listed in .publicignore
paths_to_exclude=$(awk '{print "--path " $0}' .publicignore | xargs)

git switch -c $patch_branch

# Filter the current branch only
git filter-repo --refs $patch_branch $paths_to_exclude --invert-paths --force

git switch $public_branch
git merge --no-ff $patch_branch
git push public $public_branch:master -u
