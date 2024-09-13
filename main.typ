#import "@preview/cades:0.3.0": qr-code

#let width = 210mm
#let height = 297mm
#let card_width = width / 2
#let card_height = height / 4

#set page(width: width, height: height, margin: 0mm)
#set text(font: "Source Sans Pro")

#let card() = {
  rect(
    height: card_height,
    width: card_width,
    stroke: luma(240),
    radius: 2mm,
    inset: 10mm,
    {
      place(
        left + horizon,
        {
          image("Links/ngc-rgb-logotype-black.svg", width: card_width / 3)
          v(3em)
          qr-code("https://next-generation-cartographers.github.io/", width: 1.25cm)
          place(
            left + bottom,
            dx: 2cm,
            box(
              width: card_width / 1.5,
            )[
              A welcoming space for the next generation of cartographers to share work, find
              inspiration, and connect with each other.
            ],
          )
        },
      )
    },
  )
}

#for c in (0, 1) {
  for r in (0, 1, 2, 3) {
    place(top + left, dx: c * card_width, dy: r * card_height, card())
  }
}

