+++
title = "Linux tips and tricks"
draft = false
date = "2013-01-13T08:31:46Z"
thumbnail = "img/head_code.jpg"
+++

This post list a few tips that I discovered when I started working back in 2013. I have improved my knowledge a great deal over the last years but the informations there can still be useful.

## Bash (any)

Use a default value if the variable is unset or null (see more on [parameter expansion](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html)):

~~~bash
echo "${TEST:-default}"
~~~

Transfer the parameters to a command:

~~~bash
test.sh:
  my_function "$@"

test.sh "this has spaces" 25
=> my_function will correctly receive 2 parameters: "this has spaces" and 25. If you use $@ without quotes or $*, the quoting would be lost and my_function would receive 4 parameters: "this", "has", "spaces" and "25"
~~~

Repeat last command :

~~~bash
!!
~~~

Substitute A for B in the last command and execute it:

~~~bash
^A^B^
~~~

Use the last item of the last command in the current one:

~~~bash
ls /tmp /tmp2
cd !$
pwd -> /tmp
~~~

For the first item of the last command (`^` and `$` match regexes):

~~~bash
ls /tmp /tmp2
cd !^
pwd -> /tmp2
~~~

Print every command before execution. Very useful when debugging bash scripts:

~~~bash
set -x
~~~

Exit the script at the first error (Note: beware [grep](http://unix.stackexchange.com/questions/235017/set-e-and-grep-idiom-for-preventing-premature-exit-from-shell-script-when-p))

~~~bash
set -e
~~~

Generally speaking, to increase the reliability of your scripts and prevent silent errors, this construct should be preferred:

~~~bash
set -eu
set -o pipefail
~~~

* `-e`: exit on error (warning: will not raise an error if the failing process is part of a pipe)
* `-u`: using undefined variables trigger an error
* `-o pipefail`: if a process fail in a pipe, trigger an error

## Zsh

List any compressed file in any sub-directory `**/*` ending with either bz2 or gz with a size greater than 10MB (Lm+10)

~~~zsh
ls -lh **/*.(bz2|gz)(Lm+10)
~~~

Print only the basename (t), the dirname (h) or the file name and directory without the extension \(r) of the variable FILE

~~~zsh
ls "${FILE:t}"
ls "${FILE:h}"
ls "${FILE:r}"
~~~

## Arrays

Create a new Array:

~~~bash
IDs=(ber_sim boi_mar bom_cel bou_pat che_elo cha_chr)
~~~

Print length of Array:

~~~bash
echo "${#IDs}"
~~~

## Loop

Print numbers from 1 to 5, instead of using `seq`:

~~~bash
for i in {1..5}; do echo $i; done
~~~

## find

Print the directory (%h), the file name (%f) and the size in kB (%k) of any tar.bz2 archive bigger than 20MB in subdirectories:

~~~bash
find -iname "*.tar.bz2" -size +20M -printf '%ht%ft%kkn'
~~~

Copy any .sh file in subdirectories to the current directory:

~~~bash
find -name "*.sh" -exec cp '{}' . ;
~~~

## awk

Select the second column of each line from command qjob, and for each selected part of line, execute qdel

~~~bash
qjob -l | awk '{print $2}' | while read i; do qdel $i
~~~

print the 4th value divided by 172 followed by a semicolon and the 8th value of each line of the file File.log . Two delimiters are used at the same time: `:` and `,`

~~~bash
awk -F':|,' '{print $4/172 ";" $8}' File.log
~~~

## More Infos

[How to make portable tests in bash, or what are the differences between \[ and \[\[](http://mywiki.wooledge.org/BashFAQ/031)