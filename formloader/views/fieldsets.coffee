
Pages['fieldsets'] = Pages.baseObject.extend
  item : 'Fieldset'
  type : 'fieldsets'
  initialize : (opts) ->
    @collection = app.c.fieldsets
    if opts.itemId
      @model = @collection.get(opts.itemId)
    else
      @model = new Models.Fieldset
  