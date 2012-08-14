
Pages['forms'] = Pages.baseObject.extend
  item : 'Form'
  type : 'forms'
  initialize : (opts) ->
    @collection = app.c.forms
    if opts.itemId?
      @model = @collection.get(opts.itemId)
    else
      @model = new Models.Form