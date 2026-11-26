#import "@preview/tekken:0.1.0": tekken

Inline input: #tekken("f,n,d,df,1+2, df+1, 1,2")

Held vs. tapped: #tekken("F, f, DF, df")

#tekken("1+2", display: true)

#tekken("1+2", numbers: true)

#tekken("1 + 2", numbers: true)

#tekken("u/f + 3, [df+2] *", numbers: true)

State: #tekken("f, \"Side Step\", 1+2")
