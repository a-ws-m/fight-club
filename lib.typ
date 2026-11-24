#let _directions = (
  n: "·",
  f: 0deg,
  b: 180deg,
  u: -90deg,
  d: 90deg,
  uf: -45deg,
  ub: -135deg,
  df: 45deg,
  db: 135deg,
  "u/f": -45deg,
  "u/b": -135deg,
  "d/f": 45deg,
  "d/b": 135deg,
)

#let _buttons = ("1", "2", "3", "4")
#let _symbol-baseline = (at: horizon, shift: -0.25em)

#let _button-diagram(pressed, numbers: false) = {
  let scale = if numbers { 1 } else { 0.8 }
  let diameter = scale * 0.4em
  let radius = diameter / 2
  let gap = scale * 0.02em
  let pitch = diameter + gap

  let key(label) = {
    let active = label in pressed
    circle(
      radius: radius,
      fill: if active { black } else { none },
      stroke: 0.6pt + black,
      inset: 0pt,
      if numbers {
        text(size: 0.3em, fill: if active { white } else { black })[#label]
      } else {
        none
      },
    )
  }

  let at(label, x, y, base-x, base-y) = move(
    dx: scale * x * 1em - base-x,
    dy: scale * y * 1em - base-y,
    key(label),
  )

  box(
    width: scale * 1em,
    height: scale * 1em,
    baseline: _symbol-baseline,
    grid(
      columns: (diameter, diameter),
      rows: (diameter, diameter),
      column-gutter: gap,
      row-gutter: gap,
      at("1", 0.26, 0.42, radius, radius),
      at("2", 0.60, 0.22, radius + pitch, radius),
      at("3", 0.40, 0.78, radius, radius + pitch),
      at("4", 0.74, 0.58, radius + pitch, radius + pitch),
    ),
  )
}

#let _render-part(part, numbers) = {
  let direction = _directions.at(part, default: none)
  if part == "n" {
    box(baseline: _symbol-baseline)[·]
  } else if direction != none {
    box(
      baseline: _symbol-baseline,
      rotate(
        direction,
        reflow: true,
        polygon(
          fill: black,
          (0em, 0.17em),
          (0.4em, 0.17em),
          (0.4em, 0em),
          (0.72em, 0.29em),
          (0.4em, 0.58em),
          (0.4em, 0.41em),
          (0em, 0.41em),
        ),
      ),
    )
  } else if part == "*" {
    box(baseline: _symbol-baseline)[★]
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
        box(baseline: _symbol-baseline)[+]
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
        h(0.14em)
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
