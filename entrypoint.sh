#!/bin/bash

set -e
shopt -s globstar

# source = $1
# strict = $2
# pylint-options = $3
# isort-options = $4
# django = $5

echo "===== Running Python Linter - mode: '$2' ====="
echo "Django project? '$7'"

echo "Running black"
if [ "$5" ]; then
  if [ "$2" = "high" ]; then
#    echo "Running isort"
#    isort "$1"/**/*.py -m 3 --trailing-comma ${4} -c
    echo "Running pylint"
    pylint "$1" --load-plugins pylint_django ${3}

  elif [ "$2" = "medium" ]; then
#    echo "Running isort"
#    isort "$1"/**/*.py -m 3 --trailing-comma ${4} -c
    echo "Running pylint"
    pylint "$1" --load-plugins pylint_django --fail-under=8 ${3}

  else
#    echo "Running isort"
#    isort "$1"/**/*.py -m 3 --trailing-comma ${4} --diff
    echo "Running pylint"
    pylint "$1" --load-plugins pylint_django --exit-zero ${3}
  fi

else
  if [ "$2" = "high" ]; then
    echo "Running isort"
    isort "$1"/**/*.py -m 3 --trailing-comma ${4} -c
    echo "Running pylint"
    pylint "$1" ${3}

  elif [ "$2" = "medium" ]; then
    echo "Running isort"
    isort "$1"/**/*.py -m 3 --trailing-comma ${4} -c
    echo "Running pylint"
    pylint "$1" --fail-under=8 ${3}

  else
    echo "Running isort"
    isort "$1"/**/*.py -m 3 --trailing-comma ${4} --diff
    echo "Running pylint"
    pylint "$1" --exit-zero ${3}
  fi
fi

echo "Done 🎉" ; echo ""