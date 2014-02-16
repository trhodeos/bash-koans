#!/usr/bin/env bash

set -e

# error handling hook.
# we want to catch metadata about the test failure.
error() {
  local parent_lineno="$1"
  local filename="$2"
  local message="$3"

  local line=$(head -n $parent_lineno $filename | tail -n 1)
  if [[ -n "$message" ]] ; then
    echo "Error on or near line ${parent_lineno} in ${filename}; ${message}:"
  else
    echo "Error on or near line ${parent_lineno} in ${filename}:"
  fi
  echo "  $line"
  exit 1
}

trap 'error ${LINENO} ${BASH_SOURCE}' ERR

source about_basics
source about_variables
source about_functions
source about_control_statements
source about_pipes
source about_exit_codes
