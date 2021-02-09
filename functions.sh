#!/bin/bash
create_symbolic_links(){
  BASE_DIR=`pwd`
  FILES=(`find home -type f`)
  echo "CREATING SYMBOLIC LINKS"
  for file in "${FILES[@]}"
  do
    rm -f $file
    sudo -H -u edebole bash -c ln -nfs $BASE_DIR/${file} $HOME${file/home}
  done
}
