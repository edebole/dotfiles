#!/bin/bash
create_symbolic_links(){
  BASE_DIR=`pwd`
  FILES=(`find home -type f`)
  USR='edebole'
  echo "CREATING SYMBOLIC LINKS"
  for file in "${FILES[@]}"
  do
    mkdir -p "/home/$USR${file/home}"
    ln -nvfs $BASE_DIR/${file} "/home/$USR${file/home}"
  done
}

blue(){
  echo -e "\e[34m-----------------$1-------------------\e[0m"
}
