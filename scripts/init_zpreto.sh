#! /bin/bash

current_dir=`pwd`
for rcfile in $current_dir/.zprezto/runcoms/z*; do
  file_name="${rcfile##*/}"
  if [ -e "${ZDOTDIR:-$HOME}/.${file_name}" ]; then
    rm "${ZDOTDIR:-$HOME}/.${file_name}"
  fi
  echo "ln -s $rcfile ${ZDOTDIR:-$HOME}/.${file_name}"
  ln -s $rcfile "${ZDOTDIR:-$HOME}/.${file_name}"
done
