#!/bin/bash

echo "Deploying update"

CWD="$(pwd)"

cd /Users/rohany/Documents/personal/resume
make
cd $CWD
cp /Users/rohany/Documents/personal/resume/rohan_resume.pdf static/

hugo

cp -r public/* ../
cd ../
git add .
git commit -m "site rebuild"
git push origin master
