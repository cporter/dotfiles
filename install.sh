#!/bin/sh

d=$(cd `dirname $0` ; echo $PWD)

for dotfile in .emacs .profile
do
	ln -sf "${d}/${dotfile}" "${HOME}/${dotfile}"
done
