
Models.Template = M.extend
  defaults : 
    value : ""

Collections.Templates = C.extend
  url : () ->
    "/api/#{app.m.application.id}/templates"
  model : Models.Template