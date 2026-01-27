// Create a year heading with a label.
#let year_heading(year) = {
  let now = datetime(year: year, month: 1, day: 1)

  align(
    box[
      #heading(depth: 1)[
        #now.display("[year]")
      ]
      #label(
        now.display("[year]"),
      )
    ],
    center,
  )
}

// Create a month heading with a label
#let month_heading(month) = {
  let now = datetime(year: 2025, month: month, day: 1)

  align(
    box[
      #heading(depth: 1)[
        #now.display("[month repr:long]")
      ]
      #label(
        now.display("[month repr:long]"),
      )
    ],
    center,
  )
}

// Create a diary entry with the given date.
#let diary_entry(year, month, day, body) = {
  let now = datetime(year: year, month: month, day: day)

  box[
    #heading(depth: 3)[
      #now.display(
        "[weekday], [day]. [month repr:long] [year]",
      )
    ]
    #label(
      now.display("[year]-[month]-[day]"),
    )
  ]

  line(length: 100%)

  block[#body]
}
