#!/bin/sh

reset_then_pull_because_you_prolly_forced_push () {
  git reset --hard HEAD
  git push origin -f dev:previous
  git reset --soft HEAD~1
  git fetch origin
  git stash
  git pull
}

if git pull; then
  echo 'deploy:success'
else
  echo 'deploy:alternative'
  reset_then_pull_because_you_prolly_forced_push;
fi

# when a deploy happens, do a backup
# ./backup-now.sh
