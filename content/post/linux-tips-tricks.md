+++
title = "Linux tips and tricks"
draft = true
date = "2013-01-13T08:31:46Z"

+++

## Bash (any)

Use a default value if the variable is unset or null (see more on [parameter expansion](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html):

~~~
echo ${TEST:-default}
~~~

Transfer the parameters to a command:

~~~
test.sh:
  my_function "$@"

test.sh "this has spaces" 25
=> my_function will correctly receive 2 parameters: "this has spaces" and 25. If you use $@ without quotes or $*, the quoting would be lost and my_function would receive 4 parameters: "this", "has", "spaces" and "25"
~~~

Repeat last command :

~~~
!!
~~~

Substitute A for B in the last command and execute it:

~~~
^A^B^
~~~

Use the last item of the last command in the current one:

~~~
ls /tmp /tmp2
cd !$
pwd -> /tmp
~~~

Obviously, for the first item of the last command:

~~~
ls /tmp /tmp2
cd !^
pwd -> /tmp2
~~~

Print every command before execution:

~~~
set -x
~~~

Exit the script at the first error (Note: beware [grep](http://unix.stackexchange.com/questions/235017/set-e-and-grep-idiom-for-preventing-premature-exit-from-shell-script-when-p))

~~~
set -e
~~~

## Zsh

List any compressed file in any sub-directory `**/*` ending with either bz2 or gz with a size greater than 10MB (Lm+10)

~~~
ls -lh **/*.(bz2|gz)(Lm+10)
~~~

Print only the basename (t), the dirname (h) or the file name and directory without the extension \(r) of the variable FILE

~~~
ls ${FILE:t}
ls ${FILE:h}
ls ${FILE:r}
~~~

## Arrays

Create a new Array:
~~~
IDs=(ber_sim boi_mar bom_cel bou_pat che_elo cha_chr)
~~~

Print length of Array:

~~~
echo ${#IDs}
~~~

## Loop

Print numbers from 1 to 5, instead of using `seq`:

~~~
for i in {1..5}; do echo $i; done
~~~

## find

Print the directory (%h), the file name (%f) and the size in kB (%k) of any tar.bz2 archive bigger than 20MB in subdirectories:

~~~
find -iname "*.tar.bz2" -size +20M -printf '%ht%ft%kkn'
~~~

Copy any .sh file in subdirectories to the current directory:

~~~
find -name "*.sh" -exec cp '{}' . ;
~~~

## awk
Select the second column of each line from command qjob, and for each selected part of line, execute qdel

~~~
qjob -l | awk '{print $2}' | while read i; do qdel $i
~~~

print the 4th value divided by 172 followed by a semicolon and the 8th value of each line of the file File.log . Two delimiters are used at the same time: `:` and `,`

~~~
awk -F':|,' '{print $4/172 ";" $8}' File.log
~~~

## More Infos

[How to make portable tests in bash, or what are the differences between \[ and \[\[](http://mywiki.wooledge.org/BashFAQ/031)


