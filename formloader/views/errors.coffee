
Pages['404/app'] = V.extend
  template : Templates['errors/404-app']
  initialize : () ->
    @collection = app.c.applications
  render : () ->
    @$el.html(@template({
      collection : @collection.toJSON()
    }));
    this