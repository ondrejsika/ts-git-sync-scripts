#!/bin/sh

public_branch=master-public

# Construct the command to exclude files listed in .publicignore
paths_to_exclude=$(awk '{print "--path " $0}' .publicignore | xargs)

git switch -c $public_branch

# Filter the current branch only
git filter-repo --refs $public_branch $paths_to_exclude --invert-paths --force

git push public $public_branch:master -u

