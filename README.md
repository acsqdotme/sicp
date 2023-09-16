# Ángel's solutions for MIT's *Structure and Interpretation of Computer Programs, Second Edition*

I'm reading sicp, and I'm using this repo to post my solutions for as many
exercises as I end up going through.

## how you can do the same

You can find the book [online](https://web.mit.edu/6.001/6.037/sicp.pdf) for
free. For a scheme coding environment you can download
[Racket](https://racket-lang.org/) and install their sicp package to use the
same syntax as Abelson and Sussman.

On arch, I ran:

```console
$ sudo pacman -S racket
$ raco pkg install sicp
```

just be sure to include `#lang sicp` at the top of your file.

You can use the included DrRacket IDE or be cool and stick with vim while running this a ton:

```vim
:w |! racket %
```
