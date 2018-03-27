#!/bin/bash

cd templates
rm -rf zips

for i in `ls -d */`; do 
    mkdir -p zips
    dirname=$(echo $i | sed 's/.$//')
    zip -r zips/$dirname.zip $dirname; 
    openssl sha256 zips/$dirname.zip | cut -d " " -f2 > zips/$dirname.zip.sha256
done

cd zips
json="["
for i in `ls *.zip`; do
    json="${json}{\"name\": \"$i\"},"
done
json="${json%?}]"
echo $json > index.json