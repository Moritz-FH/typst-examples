#import "lib.typ": diary_entry, month_heading, year_heading
#import "../../config.typ": config
#import "../../constants.typ": author
#show: doc => config(doc)

#set document(title: "Diary", author: author)

// disable heading numbers for nicer output
#set heading(numbering: none)

#year_heading(2025)
#month_heading(12)
#diary_entry(2025, 12, 24)[This is a diary entry.]
#diary_entry(2025, 12, 31)[
  This is another diary entry in the year @2025, the month @December and after
  the day @2025-12-24
]
