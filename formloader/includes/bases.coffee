
# Convenience alias to Backbone base objects
C = Backbone.Collection
R = Backbone.Router
N = Backbone.Navigation
P = Backbone.Paginator

# Add set & delete for the attributes object
M = Backbone.Model

# Standard form saving function and a destroy 
# (at least until the api is standardized) on that
V = Backbone.View.extend

  # Standard view destruction
  destroy : () ->
    if @model then @model.off(null, null, @)
    if @collection then @collection.off(null, null, @)
    if @editor then @editor.destroy()
    this
  
  # jGrowl interface
  jGrowl : (type, message) ->
    switch type
      when 'error' then title = 'Errors:'
      when 'success' then title = 'Success!'
      when 'info' then title = 'Note:'
    
    $.jGrowl("<h4>#{title}</h4>#{message}", {
      theme:"alert alert-#{type}"
    })

  # Bound on form submission, this will save the current
  # form to it's respective collection, waiting on the server
  # to return it's success
  saveForm : (e, form, callback) ->
    e.preventDefault()

    form ?= Helpers.jsonForm($(e.currentTarget))

    if @item is 'validations' or @item is 'decorators'
      console.log(@$("#editor").text())

    _.each ['attributes', 'meta'], (type) ->
      if form[type]?
        form[type] = _.reduce form[type]['key'], (memo, item, i) ->
          memo[item] = form[type]['value'][i]
          return memo
        , {}
      else
        form[type] = {}

    _.each ['fieldsets','fields','buttons','validations','decorators'], (type) ->
      value = @$("##{type}").val()
      if value?
        form[type] = _.compact(value.split(','))
      else
        form[type] = []

    type = if @model.isNew() then 'created' else 'updated'
    
    xhrObj =
      wait : true,
      success : (m, e) =>
        @jGrowl('success', "Your #{@item} was #{type}")
        if callback?
          callback(m)
      error : (m, e) =>
        try
          messages = JSON.parse(e.responseText)
        catch error
          messages = ['Sorry, there was an error with your request']
        ul = Backbone.View::make('ul')
        for message in messages
          ul = $(ul).append(Backbone.View::make('li', {}, message))
        @jGrowl('error', $(ul).html())
    
    if @collection? 
      @model.set(form)
      @collection.create(@model, xhrObj)
    else
      @model.set(form).save({}, xhrObj)
