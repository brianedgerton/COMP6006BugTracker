#!/bin/bash

PROJECT_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#SRC_DIR=$PROJECT_ROOT/src/classes
CLASS_DIR=$PROJECT_ROOT/WEB-INF/classes/BugTracker

# if [ ! -d "$CLASS_DIR" ]; then
#   mkdir -p $CLASS_DIR
# fi

find $CLASS_DIR -name '*.java' -exec javac -cp $PROJECT_ROOT/WEB-INF/classes {} \;