
# Wrapper for the application area
Views.App = V.extend
  
  item : 'Application'

  events : 

    # Handle clicking any link in the app
    "click a" : (e) ->
      href = $(e.currentTarget).attr('href')
      if href? and href.charAt(0) is '/'
        e.preventDefault()
        Backbone.history.navigate(href, {trigger:true})
    
    # Switch application
    "click a[data-switch-app]" : (e) ->
      e.preventDefault()
      uri = Backbone.history.getFragment().split('/')
      uri[0] = $(e.currentTarget).attr('data-switch-app')
      Backbone.history.navigate(_.first(uri, 2).join('/'), {trigger:true})
    
    # Bind for app creation
    "click  a[data-createApp]" : "createApp"
    
    # Delete an item
    "click a[data-deleteItem]" : "deleteItem"

    "submit  form[data-createApp]" : (e) ->
      @saveForm e, null, (m) ->
        appCacheAdd(m.id)
        Backbone.history.navigate("/#{m.id}", {trigger:true})
        $("#createApp").modal('hide');

  # Launch Create App Modal
  createApp : (e) ->
    e.preventDefault()
    $('#createApp').modal();

  deleteItem : (e) ->
    e.preventDefault()

  initialize : () ->
    @model = new Models.Application
    @collection = app.c.applications

# Top navigation area
Views.TopNav = V.extend

  template : Templates['partials/nav']
  
  # Initialize a route
  initialize : () ->
    Backbone.history.on('route', @render, @)
    @on('repaint', @render, @)
  
  # Render the application
  render : () ->
    @$el.html(@template({
      active : @getNav()
      apps : app.c.applications.toJSON()
      application : app.m.application.get('id')
    }))
    this

  # Get the active element type
  getNav : () ->
    if Backbone.History.started
      frag = Backbone.history.getFragment().split('/')
      return frag[1]
    return null

# Wrapper Views
Views.Main = V.extend
  inject : (html) ->
    @$el.empty()
    @$el.append(html)
    this
  