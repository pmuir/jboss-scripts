#!/bin/bash

# Require BASH 3 or newer

REQUIRED_BASH_VERSION=3.0.0

if [[ $BASH_VERSION < $REQUIRED_BASH_VERSION ]]; then
  echo "You must use Bash version 3 or newer to run this script"
  exit
fi

# Canonicalise the source dir, allow this script to be called anywhere

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# DEFINE

TARGET=$DIR/target

echo "** Building tutorial"

echo "**** Cleaning $TARGET"
rm -rf $TARGET
mkdir -p $TARGET

echo "**** Copying shared resources to $TARGET"
cp -r gfx $TARGET

files=`find * -iname "*.asciidoc"`

for file in $files
do
    output_filename=$TARGET/${file//.asciidoc/.html}
    echo "**** Processing $file > ${output_filename}"
    asciidoc -b xhtml11 -a pygments -o ${output_filename} $file  
done
