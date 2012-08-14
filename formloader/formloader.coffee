###
Formloader: A Neat app for constructing all sorts of forms...

@author  - Tim Griesser <tim at tgriesser.com>
@license - MIT License 
@link    - https://github.com/tgriesser/formloader
###

# Require all standard javascript libs for the application
{{= c.press.raw('raw/json2.js', 'raw/jquery.js', 'raw/underscore.js'
  , 'raw/backbone.js', 'raw/select2.js', 'raw/bootstrap-dropdown.js', 'raw/bootstrap-modal.js', 'raw/jgrowl.js'
  , '../node_modules/checkit/lib/checkit.js', 'raw/jqUI.js') }}

# All necessary includes (in order) from lib/includes
{{= c.press.once('includes/namespaces', 'includes/bases') }}

{{= c.press.once('helpers/*') }}

# Application object instance store
app = 
  c : {}
  m : {}
  v : {}
  r : {}

# Require data.* for underscore templates
_.templateSettings.variable = 'data'

# Require all application templates, objects, and routers
{{= c.press.templates('templates/*', 'formloader/templates/') }}

# Objects: app collections & models
{{= c.press.once('objects/*') }}

# Views & Pages
{{= c.press.once('views/wrapper', 'views/*') }}

# Include the app's base router
{{= c.press.once('routers/*') }}

# Collections
app.c.forms        = new Collections.Forms
app.c.fieldsets    = new Collections.Fieldsets
app.c.fields       = new Collections.Fields
app.c.buttons      = new Collections.Buttons
app.c.validations  = new Collections.Validations
app.c.decorators   = new Collections.Decorators

# Formloader Instances
app.c.applications = new Collections.Applications

# Formloader instance we're currently editing
app.m.application  = new Models.Application

# Router instance
app.r.main = new Routers.Main

# Expose the app to the window
window.formloader = app

# The container object for the application data
AppCache = {};

# Add an item to the app cache
appCacheAdd = (name) ->
  AppCache[name] = {}
  _.each ['forms', 'fields', 'fieldsets', 'buttons', 'validations', 'decorators'], (item) ->
    AppCache[name][item] = []

# Prep the application object
prepObj = (obj) ->
  _.each obj, (v, k, list) ->
    list[k] = _.reduce v, (memo, value, key) ->
      if k is 'decorators' or k is 'validations'
        memo.push({id : key, value : value})
      else
        memo.push(_.extend(value, {id : key}))
      memo
    , []
  return obj

# Init the app
$ ->
  
  app.v.app  = new Views.App({el : $("#app") })
  app.v.main = new Views.Main({el : $("#formloader")}).render()
  
  # Grab & Process all of the raw form object items
  Backbone.sync('read', {}, {
    url : '/api/bootstrap'
    success : (data) ->
      appReset = []

      # The object contianing all of our application instances
      for k, v of data
        appReset.push({id:k})
        AppCache[k] = prepObj(v)

      app.c.applications.reset(appReset)

      # Start the engines
      app.v.nav  = new Views.TopNav({el : $("#subnav")}).render()
      Backbone.history.start({pushState:true})
    
    error : (data) ->
      alert('Error with initializing the application, check that your data isn\'t screwed up or anything')
  })
  
# End of Formloader.coffee