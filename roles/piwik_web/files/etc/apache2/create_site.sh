#!/bin/bash -e
echo $1
echo $2
sed -s "s/dummy_website/$1/g"  dummy_website | sed -s "s/dummy_path/$2/g" > "sites-available/$1"
