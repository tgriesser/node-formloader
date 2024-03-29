
Models.Button = M.extend
  defaults :
    tagName    : 'button'
    templates   : null
    
    # Common
    meta  : null
    attributes  : null
    decorators  : null
    validations : null

Collections.Buttons = C.extend
  url : () ->
    "/api/#{app.m.application.id}/buttons"
  model : Models.Button