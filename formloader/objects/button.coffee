
Models.Button = M.extend
  defaults :
    tagName    : 'button'
    value      : 'Button'

    # Common
    meta        : null
    decorators  : null
    attributes  : null
    validations : null

Collections.Buttons = C.extend
  url : () ->
    "/api/#{app.m.application.id}/buttons"
  model : Models.Button