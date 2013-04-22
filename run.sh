#!/bin/bash
PROJECT_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $PROJECT_ROOT;
./build.sh
catalina run