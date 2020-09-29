#!/bin/sh

# Update the remote references
git fetch

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

# Rebuild the application after an codebase update
rebuild() {
    yarn install
    yarn build
    func extensions install
}

# Start the application
start() {
    func start --javascript
}

if [ $LOCAL = $REMOTE ]; then
    # The local branch is Up to date
    echo "Up-to-date"
elif [ $LOCAL = $BASE ]; then
    # Remote branch has newest commits
    git pull
    rebuild
elif [ $REMOTE = $BASE ]; then
    # Some commits was removed from remote branch
    git reset --hard @{u}
    rebuild
else
    # Local branch and remote branch are diverged
    git reset --hard @{u}
    rebuild
fi

start