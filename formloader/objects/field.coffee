
Models.Field = M.extend
  defaults :
    tagName     : 'input'
    label       : null
    
    # Common
    meta        : null
    decorators  : null
    attributes  : null
    validations : null

Collections.Fields = C.extend
  url : () ->
    "/api/#{app.m.application.id}/fields"
  model : Models.Field