#!/usr/bin/env bash

# Exit on error
set -e

source "./test_CMakePublic.sh $1"
source "./test_CMaizePublicDepend2.sh $1"
