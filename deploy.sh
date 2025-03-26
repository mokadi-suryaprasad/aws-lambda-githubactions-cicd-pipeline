#!/bin/bash
for func in function1 function2 function3; do
  zip -r ${func}.zip lambda/${func}/*
  aws lambda update-function-code --function-name ${func} --zip-file fileb://${func}.zip
done
