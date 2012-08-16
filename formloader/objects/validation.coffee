
Models.Validation = M.extend
  defaults :
    name  : ""
    value : ""
    
    # Common
    meta        : null
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
    'isNaN', 'isNull', 'isUndefined', 'integer', 'numeric', 'integer', 'decimal', 'alpha',
    'alphaNumeric', 'alphaDash', 'alphaUnderscore', 'natural', 'naturalNonZero', 'ip4',
    'base64']