
Pages['buttons'] = Pages.baseObject.extend
  item : 'Button'
  type : 'buttons'
  initialize : (opts) ->
    @collection = app.c.buttons
    if opts.itemId?
      @model = @collection.get(opts.itemId)
    else
      @model = new Models.Button