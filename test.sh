#!/usr/bin/env bash
for DIR in merge miner plot transform; do
  cd $DIR || exit 1

  echo "Running tests in $DIR ..."
  python -m unittest discover -s . -p '*_test.py'
  RESULT=$?

  cd ..

  if [ $RESULT -ne 0 ]; then
    echo "ERROR: Tests failed"
    exit 1
  fi
done

echo "SUCCESS"
