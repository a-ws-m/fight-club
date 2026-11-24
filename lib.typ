#let _directions = (
  n: "·",
  f: "→",
  b: "←",
  u: "↑",
  d: "↓",
  uf: "↗",
  ub: "↖",
  df: "↘",
  db: "↙",
  "u/f": "↗",
  "u/b": "↖",
  "d/f": "↘",
  "d/b": "↙",
)

#let _buttons = ("1", "2", "3", "4")

#let _button-diagram(pressed, numbers: false) = {
  let key(label) = {
    let active = label in pressed
    circle(
      radius: if numbers { 0.22em } else { 0.2em },
      fill: if active { black } else { none },
      stroke: 0.6pt + black,
      inset: 0pt,
      if numbers {
        text(size: 0.35em, fill: if active { white } else { black })[#label]
      } else {
        none
      },
    )
  }

  box(
    baseline: 0.2em,
    grid(
      columns: 2,
      rows: 2,
      column-gutter: 0.08em,
      row-gutter: 0.08em,
      align: center,
      key("1"), key("2"),
      key("3"), key("4"),
    ),
  )
}

#let _render-part(part, numbers) = {
  let direction = _directions.at(part, default: none)
  if direction != none {
    [#direction]
  } else if part == "*" {
    [★]
  } else if part in _buttons {
    _button-diagram((part,), numbers: numbers)
  } else {
    [#part]
  }
}

#let _render-token(token, numbers) = {
  let parts = token.split("+")
  if parts.len() > 1 and parts.all(part => part in _buttons) {
    _button-diagram(parts, numbers: numbers)
  } else {
    for (index, part) in parts.enumerate() {
      if index > 0 {
        h(0.08em)
        [+]
        h(0.08em)
      }
      _render-part(part, numbers)
    }
  }
}

// Render Tekken notation inline, or as a standalone block with `display: true`.
#let tekken(input, numbers: false, display: false) = {
  let source = input.replace(",", " , ")
  for mark in ("[", "]", "(", ")", "~", "*", "-") {
    source = source.replace(mark, " " + mark + " ")
  }
  source = source.replace(regex("\\s*\\+\\s*"), "+")
  let tokens = source.split()
  let notation = {
    for (index, token) in tokens.enumerate() {
      if token == "," {
        [, ]
      } else {
        if index > 0 and tokens.at(index - 1) != "," {
          h(0.14em)
        }
        _render-token(token, numbers)
      }
    }
  }

  if display {
    block(above: 0.4em, below: 0.4em, notation)
  } else {
    notation
  }
}
