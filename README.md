# SIMPLY SCHEME EXERCISES

NOTE: It would be cool to see other peoples solutions to these problems! ;)

This project contains my solutions to the exercises and projects
presented at the end of each chapter in the textbook Simply Scheme
(Brian Harvey and Matthew Wright, 2nd ed, MIT 1999).

The book is freely available here: http://www.cs.berkeley.edu/~bh/ss-toc2.html

I have omitted the first two chapters as they are very basic
and contain little or no actual code. Also, on most chapters,
there is a section called "Boring exercises" and a section
called "Real exercises". I've omitted all boring exercises
because their solutions contain no actual code and they are...
well... boring.

The code samples throughout the book use a slightly modified
implementation of Scheme (syntactically LISP, but with some
additional primitive procedures). To get this augmentation
working correctly in Dr. Scheme, you must choose "Pretty Big"
from the languages menu and then install the extensions via
the REPL:

```
> (require (planet dyoo/simply-scheme:1:2/simply-scheme))
```

I try to only use concepts and procedures that have been introduced
when answering questions (e.g I don't use recursion before it's been
discussed, nor do I use variables -- other than the lambda shorthand
notation -- until chapter 7).

For the record, I recommend this particular book for anyone who:

  0) Wants to (re)learn LISP and/or functional programming
  1) Finds SiCP difficult to digest (hint: read SS and then SiCP)
  2) Is looking for a good introduction to programming

The text is available for free in PDF format. It's distributed under
the GNU General Public License. I place all of my solutions and original
work on this project in the public domain.
