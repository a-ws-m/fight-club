#import "@preview/tekken:0.1.0": tekken

Inline input: #tekken("f,n,d,df,1+2, df+1, 1,2")

Equivalent diagonals: #tekken("df, d/f, DF, D/F")

Held vs. tapped: #tekken("F, f, DF, df")

#tekken("1+2", display: true)

#tekken("1+2", numbers: true)

#tekken("1 + 2", numbers: true)

#tekken("u/f + 3, [df+2] *", numbers: true)

State: #tekken("f, \"Side Step\", 1+2")

= Inline wrapping

The sequence below runs through several steps within a narrow paragraph.

#block(width: 7cm)[
  A sequence can wrap inline: #tekken("f, n, d, df, 1+2, df+1, [df+2], F, u/f, \"Side Step\", 3+4, b, 1, 2") and continue alongside the surrounding text.
]

Steve string: #tekken("4,1,2~1")

Heihachi Electric Wind God Fist: #tekken("f,n,d,df:2")

Kazuya Hellsweep: #tekken("f,n,d,df+4,1")
