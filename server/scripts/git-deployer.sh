#!/bin/sh

if git pull; then
    echo 'deploy:success'
else
    echo 'deploy:failure'
fi
