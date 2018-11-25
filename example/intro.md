---
header-includes:
  - \usepackage{cleveref}
  - \usepackage{amsmath}
  - \usepackage{algorithm}
  - \usepackage{algpseudocode}
  - 
---

# Introduction

This is an introduction

## First part of the introduction

Another paragraph

# Section
This is our first section.

Another paragraph.

We can use Markdown for figures.

Markdown for lists

* One
* Two
    * Nested one
* Three
    1. Numerated list
    1. No need to specify number

We can even inline math: $y = ax + b$.
How about displayed equations:

$$
y = -2.2x + 0.5
$$

## Golang code

!INCLUDECODE "main.go" (go)

## Euclid's algo
This is some text

\begin{algorithm}
    \caption{Euclid’s algorithm}
    \begin{algorithmic}[1] % The number tells where the line numbering should start
        \Procedure{Euclid}{$a,b$} \Comment{The g.c.d. of a and b}
            \State $r\gets a \bmod b$
            \While{$r\not=0$} \Comment{We have the answer if r is 0}
                \State $a \gets b$
                \State $b \gets r$
                \State $r \gets a \bmod b$
            \EndWhile
            \State \textbf{return} $b$\Comment{The gcd is b}
        \EndProcedure
    \end{algorithmic}
\end{algorithm}


## Subsection
Just use Markdown to define sections and structure of the document.

Let's finish with a footnote.[^1]

[^1]: I'm a footnote!
