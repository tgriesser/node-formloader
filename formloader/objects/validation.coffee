
Models.Validation = M.extend
  defaults :
    name       : ""
    type       : "" # Preset, regex, function, module, etc.
    
    # Common
    meta        : null
    decorators  : null
    attributes  : null
    validations : null
  
Collections.Validations = C.extend
  url : () ->
    "/api/#{app.m.application.id}/validations"
  model : Models.Validation
  selectOpts : ['required', 'contains', 'lessThan', 'greaterThan', 'exactLength', 
    'maxLength', 'minLength', 'validEmail', 'validEmails', 'any', 'include', 
    'has', 'isEmpty', 'isEqual', 'isElement', 'isArray', 'isObject', 'isArguments', 
    'isFunction', 'isString', 'isNumber', 'isFinite', 'isBoolean', 'isDate', 'isRegExp', 
    'isNaN', 'isNull', 'isUndefined']