
Pages['fields'] = Pages.baseObject.extend
  item : 'Field'
  type : 'fields'
  initialize : (opts) ->
    @collection = app.c.fields
    if opts.itemId?
      @model = @collection.get(opts.itemId)
    else
      @model = new Models.Field