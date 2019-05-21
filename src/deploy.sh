#!/bin/bash

echo "Deploying update"

hugo

cp -r public/* ../
cd ../
git add .
git commit -m "site rebuild"
git push origin master
