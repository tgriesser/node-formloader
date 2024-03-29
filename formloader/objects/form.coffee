
Models.Form = M.extend
  defaults :
    tagName     : 'form'
    templates   : null
    
    # Select2 Items
    fieldsets   : null
    fields      : null
    buttons     : null

    # Common
    meta        : null
    decorators  : null
    attributes  : null
    validations : null

Collections.Forms = C.extend
  url : () ->
    "/api/#{app.m.application.id}/forms"
  model : Models.Form