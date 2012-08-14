
# Application instance
Models.Application = M.extend

  defaults :
    id : null
    active : false
  
  item : 'application'

  initialize : () ->

    @on('change:active', (m) ->
      
      if m.get('active')
        appCache = AppCache[m.id]
        
        # Check if there is an active application set  
        # in which case, disable it
        if app.c.applications.activeApp?
          app.c.applications.activeApp.set('active', false)

        # Set the active app to the new one
        app.c.applications.activeApp = m

        app.m.application = m
        app.c.forms.reset(appCache.forms)
        app.c.fields.reset(appCache.fields)
        app.c.fieldsets.reset(appCache.fieldsets)
        app.c.buttons.reset(appCache.buttons)
        app.c.validations.reset(appCache.validations)
        app.c.decorators.reset(appCache.decorators)

        # Repaint the nav so all navigation routes are relative
        app.v.nav.trigger('repaint')
    , @)
  
  reduceObj : (obj) ->
    _.reduce obj, (memo, value, key) ->
      memo.push(_.extend(value, {'key':key}))
      memo
    , []

Collections.Applications = C.extend
  url : '/api/applications'
  model : Models.Application
  activeApp : null