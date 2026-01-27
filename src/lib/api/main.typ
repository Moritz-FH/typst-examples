#import "lib.typ": endpoint_entry
#import "../../config.typ": config
#import "../../constants.typ": author
#show: doc => config(doc)

#set document(title: "API", author: author)

= Endpoints
#endpoint_entry(("get", "post"), "/api/status", example: "curl /api/status")[
  Status of the endpoint
]
