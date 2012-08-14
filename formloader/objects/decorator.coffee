
Models.Decorator = M.extend
  defaults : 
    value : ""

Collections.Decorators = C.extend
  url : () ->
    "/api/#{app.m.application.id}/decorators"
  model : Models.Decorator