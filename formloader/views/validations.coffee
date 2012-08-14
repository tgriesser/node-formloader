
Pages['validations'] = Pages.baseObject.extend
  item : 'Validation'
  type : 'validations'
  initialize : (opts) ->
    @collection = app.c.validations
    if opts.itemId?
      @model = @collection.get(opts.itemId)
    else
      @model = new Models.Validation
  render : () ->
    Pages.baseObject::render.apply(this, arguments)
    @initAce()
    this