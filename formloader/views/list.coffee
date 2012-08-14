
# A generic list
Pages['list'] = V.extend
  events : 
    # Delete an item
    "click a[data-deleteItem]" : "deleteItem"

  template : Templates['list']

  initialize : (opts) ->
    @type = opts.itemId
    @collection = app.c[@type]
    @collection.on('destroy', @render, @)

  render : () ->
    @$el.html(@template({
      ucType : @type.charAt(0).toUpperCase() + @type.slice(1)
      type : @type
      collection : @collection.toJSON()
      application : app.m.application.get('id')
    }))
    this

  deleteItem : (e) ->
    e.preventDefault()
    if confirm("Are you sure you want to delete this '#{@type}' item")
      item = $(e.currentTarget).attr('data-deleteItem')
      @collection.get(item).destroy
        wait:true
        success : () =>
          @jGrowl('success', "The #{@type} - #{item} was successfully deleted")