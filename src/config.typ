#let config(doc) = {
  // page
  set page(
    paper: "a4",
    margin: (right: 10mm, left: 20mm),
    header: box[
      #context [#document.title]
      #h(1fr)
      #context [#document.author.join(" | ")]
      #line(length: 100%)
    ],
    footer: box[
      #line(length: 100%)
      #datetime.today().display()
      #h(1fr)
      #context [#counter(page).display("1 / 1", both: true)]
    ],
  )

  // heading
  set heading(numbering: "1.")

  // outline
  set outline(title: "Table of Content", depth: 3)

  // basic
  set text(size: 4mm, hyphenate: false)
  set par(justify: true)

  // raw
  show raw.where(block: true): set text(fill: white)
  show raw.where(block: true): block.with(
    fill: luma(50),
    width: 100%,
    inset: 5mm,
    radius: 1mm,
  )
  show raw.where(block: false): box.with(
    fill: luma(150),
    inset: 1mm,
    radius: 1mm,
  )

  // figure
  show figure: set block(breakable: true)
  show figure.where(kind: table): set figure.caption(position: top)

  // table
  set table(
    fill: (_, y) => if calc.odd(y) { rgb(200, 200, 200) },
  )
  show table.cell.where(x: 0): set text(weight: "bold")
  show table.cell.where(y: 0): set text(weight: "bold")

  // image
  set image(width: 50mm)

  // label
  show ref: it => {
    if it.element.numbering == none {
      link(it.target, it.element.body)
    } else {
      it
    }
  }

  doc
}
