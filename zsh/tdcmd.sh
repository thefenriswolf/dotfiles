#!/usr/bin/env sh

if [ "$1" = "t" ]; then
    emacs -Q -batch -eval '(org-batch-agenda "t"
                            org-agenda-include-diary nil
                            org-agenda-files(quote("~/org/todo.org")))' -kill
elif [ "$1" = "a" ]; then
    emacs -Q -batch -eval '(org-batch-agenda "a"
                            org-agenda-span (quote week)
                            org-agenda-include-diary nil
                            org-agenda-files(quote("~/org/todo.org")))' -kill
else
    echo "invalid argument"
fi
