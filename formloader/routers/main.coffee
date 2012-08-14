
# Main Formloader Application Router
Routers.Main = R.extend

  routes :
    ':application/:type/create' : 'createItem'
    ':application/:type/:key'   : 'editItem'
    ':application/:type'        : 'listItems'
    ':application'              : 'listForms'
    
    '*base' : 'base'

  validTypes : ['applications', 'fields', 'forms', 'fieldsets', 'decorators', 'validations', 'buttons']

  initialize : () ->
    @on 'all', () ->
      if LastPage?
        LastPage.destroy().remove()

  # Root of the application
  base : () ->
    if app.c.applications.length is 0
      app.v.main.inject(new Pages['application/create']().render().el)
    else
      @render('list', 'applications')

  # Create application item
  createItem : (application, type) ->
    if @checkApp(application) and @checkItem(type)
      @render(type)
      
  # Edit application item
  editItem : (application, type, key) ->
    if @checkApp(application) and @checkItem(type)
      @render(type, key)

  # List application items
  listItems : (application, type) ->
    if @checkApp(application) and @checkItem(type)
      @render('list', type)
  
  # List all of the form items
  listForms : (application) ->
    @listItems(application, 'forms')

  # Check the application
  checkApp : (appName) ->
    currentApp = app.c.applications.get(appName)
    if currentApp?
      currentApp.set('active', true)
      return true
    else
      return false

  # Check whether this is a type we're editing in the app
  checkItem : (type) ->
    _.indexOf(@validTypes, type) isnt -1
  
  # Render the page, passing the id of the item to edit
  render : (page, id) ->
    app.v.main.inject(new Pages[page]({
      itemId : id
    }).render().el)