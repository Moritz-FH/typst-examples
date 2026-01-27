// Endpoint entry
#let endpoint_entry(method, url, example: none, depth: 2, body) = {
  let method-string = {
    if type(method) == str {
      method
    } else {
      method.join(" | ")
    }
  }

  heading(depth: depth)[#upper(method-string) #url]

  body

  if example != none {
    linebreak()
    [#underline[Example:] #raw(example, lang: "shell")]
  }
}
