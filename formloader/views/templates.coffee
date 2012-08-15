
Pages['templates'] = Pages.baseObject.extend
  item : 'Template'
  type : 'templates'
  initialize : (opts) ->
    @collection = app.c.templates
    if opts.itemId?
      @model = @collection.get(opts.itemId)
    else
      @model = new Models.Template
  render : () ->
    Pages.baseObject::render.apply(this, arguments)
    @initAce('ace/mode/html')
    this