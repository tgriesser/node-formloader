
Models.Label = M.extend
  defaults :
    tagName    : 'button'
    
    # Common
    meta        : null
    decorators  : null
    attributes  : null
    validations : null
    
Collections.Labels = C.extend
  url : () ->
    "/api/#{app.m.application.id}/labels"
  model : Models.Label