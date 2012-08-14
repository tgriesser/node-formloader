
# Require all modules
fs   = require('fs')
path = require('path')

ObjectDump = require('objectdump')
settings   = require('../settings')
_          = require('underscore')

# ApiError, for any api screw ups
class ApiError
  constructor : (message, line, col, pos) ->
    @message = message
    @line = line + 1
    @col = col + 1
    @pos = pos + 1
    @stack = new Error().stack
  toString : () ->
    return this.message + " (line: " + this.line + ", col: " + this.col + ", pos: " + this.pos + ")" + "\n\n" + this.stack

# Namespaces & Constants
Apps = {}
OutputDir = path.join(__dirname, '../', settings.outputDir);

# Prep the Backbone's JSON by removing the ID and any empties
# and setting the value to a function if it is a validation
# or decorator input
# {object} - javascript object to prep
# {string} - type of item we're prepping for
prepInput = (json, type) ->
  
  # Delete the ID & Key from the json block
  delete json.id
  delete json.key
  
  if _.indexOf(['forms', 'fieldsets', 'fields', 'buttons'], type) isnt -1

    # Unnecessary to store the default tag
    if json.tagName is settings.defaultTags[type] 
      delete json.tagName

  if _.indexOf(['validations', 'decorators'], type) isnt -1
  
    return json.value
  _.each json, (value, key) ->
  
    if (_.isEmpty(value) and ! _.isString(value))
      delete json[key];
  
  return json

# Save the application, by eval'ing the App
# {string} - name - name of the app being saved
saveApp = (name) ->
  output = new ObjectDump(eval(Apps[name])).render(settings.dump(name));

  # Create the file
  fs.writeFile path.join(OutputDir, name.toLowerCase() + '.js'), output, 'UTF-8', () ->
    
    # Alert that the app was saved
    console.log("App #{name} updated!")

# Updates the item throughout the app,
# in the case that the name is changed
# {string} - name - name of the application being edited
# {string} - type - type of item being edited
# {string} - key  - key of the item to change or delete
# {string|null} - value - if null, the item will be deleted
updateItemRef = (name, type, key, value) ->
  _.each Apps[name], (v, k) ->
    _.each v, (v2, k2) ->
      if v2[type]? and _.isArray(v2[type])
        if (i = _.indexOf(v2[type], key)) isnt -1
          if value?
            v2[type][i] = value 
          else 
            v2[type] = _.without(v2[type], key)

# Initialize the Formloader Applications from the fs
# {string} - outputDir - directory where the files are read from
initApp = (outputDir) ->
  
  fs.readdir outputDir, (err, files) ->
    
    _.each files, (file) ->
      
      fs.stat path.join(outputDir, file), (err, stats) ->
        
        if stats.isDirectory()
          initApp(path.join(outputDir, file))
        else
          app = require(path.join(outputDir, file))
            
          for k, v of app
            Apps[k] = new ObjectDump(v).deepStringify()

# Initialize the application based on the output path
initApp(OutputDir)

# -----------------------------
# Application API
# -----------------------------
module.exports =
  
  Apps : Apps

  # Creates a new item on the app
  # {string} - name  - application name
  # {string} - type  - type of item being created
  # {string} - key   - name of the key being created
  # {string} - value - value for the item being created
  createItem : (name, type, key, value) ->
    if Apps[name]?
      Apps[name][type][key] = prepInput(value, type)
      saveApp(name)
  
  # Updates an item on the app, checking
  # if the ID has changed, updating references accordingly
  # {string} - name  - application name
  # {string} - type  - type of item being updated
  # {string} - key   - name of the key being updated
  # {string} - value - value for the item being updated
  updateItem : (name, type, key, value) ->
    resp = {}
    appItem = Apps[name][type]
    if Apps[name]?
      if value.id isnt value.key
        delete appItem[value.id]
        resp.id = value.key
        updateItemRef(name, type, value.id, value.key)
      Apps[name][type][value.key] = prepInput(value, type)
      saveApp(name)
      return resp
    else
      throw new ApiError("The #{name} - #{type} - #{key} isn't defined")

  # Removes an item from an app, 
  # removing references within the app
  # {string} - name  - application name
  # {string} - type  - type of item being removed
  # {string} - key   - name of the key being removed
  removeItem : (name, type, key) ->
    if Apps[name]?[type]?[key]?
      app = Apps[name]
      delete app[type][key]
      updateItemRef(name, type, key)
      saveApp(name)

  # Create a new application
  # {object}   - name - name of the app
  # {function} - callback - to be executed when the file is created
  createApp : (name, callback) ->
    
    appFilename = path.join(OutputDir, name.toLowerCase() + '.js')
    
    if Apps[name]? then return callback(new ApiError("App #{name} already exists"), null)

    # Check if the file exists, if not create it
    fs.exists OutputDir, (exists) ->
      
      if not exists then return callback(new ApiError('Directory doesn\'t exist'), null)

      # Check if the app path exists
      fs.exists appFilename, (exists) ->
        
        if exists then return callback(new ApiError('File already Exists'), null)
        
        # Build the initial appCache object
        Apps[name] = {
          forms : {}, fields : {}, fieldsets : {}, buttons : {}, validations : {}, decorators : {}
        }
        
        # Create the file
        fs.writeFile appFilename, new ObjectDump(Apps[name]).render(settings.dump(name)), 'UTF-8', () ->
          
          # Create the namespace for the application
          callback(null, 'File created')
