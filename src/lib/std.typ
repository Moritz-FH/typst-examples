// Transform various types into string
//
// https://github.com/typst/typst/issues/2196#issuecomment-1728135476
#let to_str(it) = {
  if type(it) == str {
    it
  } else if type(it) != content {
    str(it)
  } else if it.has("text") {
    it.text
  } else if it.has("children") {
    it.children.map(to-string).join()
  } else if it.has("body") {
    to-string(it.body)
  } else if it == [ ] {
    " "
  }
}

// Create a table from a dictionary
//
// The dictionary must have following formation (YAML as example)
//
// ```yaml
// attributes:
//  name: Name
//  age: Age
// table:
//  max:
//    name: Max
//    age: 30
//  anna:
//    name: Anna
//    age: 25
// ```
// The columns are defined via the lowest dictionary key (in the example `name`
// & `age`)
//
// The header of the table is defined via the attributes values (in the example
// `Name` & `Age`)
//
// It is possible to select out attributes by adding them via the `attr`
// argument (e.g. ```typst attr: ("name")``` will only show values from the
// `name` attribute)
#let dict_table(dict, cap: "", attr: none) = {
  // Split dict in attr and tuples
  let a = dict.at("table").at("attributes")
  let t = dict.at("table").at("tuples")

  // Assign all attributes if attr is empty
  if attr == none or attr == () {
    attr = a.keys()
  }

  // Create header array with assigned attributes
  let h = {
    let header = ()
    for (k, v) in a {
      if k in attr {
        header.push(k)
      }
    }
    header.map(it => to_str(it))
  }

  // Create array with assigned attributes
  let r = {
    let rows = ()
    for (k, p) in t {
      for (k, v) in p {
        if k in attr {
          rows.push(v)
        }
      }
    }
    let _ = rows.flatten()
    rows.map(it => to_str(it))
  }

  figure(
    caption: cap,
    table(
      columns: h.len(),
      table.header(..h),
      ..r
    )
  )
}
