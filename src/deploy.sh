#!/bin/bash

echo "Deploying update"

CWD="$(pwd)"

hugo

cd /Users/rohany/Documents/resume
make
cd $CWD
cp /Users/rohany/Documents/resume/rohan_resume.pdf static/

cp -r public/* ../
cd ../
git add .
git commit -m "site rebuild"
git push origin master
