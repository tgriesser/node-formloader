
Models.Fieldset = M.extend
  defaults :
    tagName     : 'fieldset'

    legend      : null
    fields      : null

    # Common
    meta        : null
    decorators  : null
    attributes  : null
    validations : null

Collections.Fieldsets = C.extend
  url : () ->
    "/api/#{app.m.application.id}/fieldsets"
  model : Models.Fieldset
  