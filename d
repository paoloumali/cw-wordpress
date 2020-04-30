#!/usr/bin/env bash

if [ $# -gt 0 ]; then
  if [ "$1" == "reload" ] || [ "$1" == "r" ]; then
    vagrant reload --provision

  elif [ "$1" == "v" ] || [ "$1" == "vagrant" ]; then
    shift;
    vagrant "$@"
  fi
fi
