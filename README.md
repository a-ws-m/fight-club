# Tekken for Typst

Render Tekken directions and attack inputs as compact diagrams in Typst.

```typst
#import "@preview/tekken:0.1.0": tekken

Electric: #tekken("f,n,d,df,2")

#tekken("df+1, 1, 2", display: true)

#tekken("1+2", numbers: true)
```

Each attack input draws four buttons in a cardinal layout: `1` left, `2` up,
`3` down, and `4` right. Pressed buttons are filled; unpressed buttons are
outlined. Set `numbers: true` to label the buttons. Directions use `f`, `b`,
`u`, `d`, `n`, and diagonal combinations such as `df` or `d/f`. Separate
sequence steps with commas or spaces, and join simultaneous buttons with `+`.
Set `display: true` to place the notation on its own line.

The package is designed for Tekken notation and is not affiliated with Bandai
Namco Entertainment.
