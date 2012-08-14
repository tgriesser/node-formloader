
Pages['decorators'] = Pages.baseObject.extend
  item : 'Decorator'
  type : 'decorators'
  initialize : (opts) ->
    @collection = app.c.decorators
    if opts.itemId?
      @model = @collection.get(opts.itemId)
    else
      @model = new Models.Decorator
  render : () ->
    Pages.baseObject::render.apply(this, arguments)
    @initAce()
    this