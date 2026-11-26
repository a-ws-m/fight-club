#import "@preview/fight-club:0.1.0": tekken

Inline input: #tekken("f,n,d,df,1+2, df+1, 1,2")

Equivalent diagonals: #tekken("df, d/f, DF, D/F")

Held vs. tapped: #tekken("F, f, DF, df")

Use `display` to typeset the string into its own block: #tekken("1+2", display: true)

You can also explicitly render the buttons' numbers: #tekken("1+2", numbers: true)

You can use brackets: #tekken("u/f + 3, [df+2] *", numbers: true)

Include states/input shorthands using quotes: #tekken("f, \"Side Step\", 1+2")

= Inline wrapping

#block(width: 7cm)[
  A sequence can wrap inline: #tekken("f, n, d, df, 1+2, df+1, [df+2], F, u/f, \"Side Step\", 3+4, b, 1, 2") and continue alongside the surrounding text.
]

= Real combo examples

Steve string: #tekken("4,1,2~1")

Heihachi Electric Wind God Fist: #tekken("f,n,d,df:2")

Kazuya Hellsweep: #tekken("f,n,d,df+4,1")

Without plus signs: #tekken("df+2, f+1+2", plus: false)

Without separators: #tekken("f, n, d, df+2", separator: false)
