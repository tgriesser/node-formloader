
# Tim Griesser
# Assorted form helpers
# MIT License 

# Ensure that all checks are a boolean
Helpers.jsonChecks = ($arr) ->
  _.reduce($arr, (memo, item) -> 
    item = $(item)
    memo[item.attr('name')] = if item.is(':checked') then on else off
    return memo
  , {})

# Turn a form into a nice javascript object
Helpers.jsonForm = ($form) ->
  _.extend(_.reduce($form.serializeArray(), (memo, item) ->
    arr = item.name.indexOf('[]') isnt -1
    itemArr = item.name.replace('[]','').replace('[', '.').replace(']','').split('.')
    _.reduce(itemArr, (m2, i2, k) ->
      if k + 1 is itemArr.length
        if arr
          m2[i2] ?= []
          m2[i2].push(item.value)
        else
          m2[i2] = item.value
      else if not m2[i2]
        m2[i2] = {}
        k++
      m2[i2]
    , memo)
    memo
  , {}), @jsonChecks($form.find("input[type=checkbox]")), @jsonChecks($form.find("input[type=radio]")))

# Add errors to a form
Helpers.errorForm = ($form, errors) ->
  for error in errors
    if error.$el
      item = error.$el
    else
      item = $form.find("[name='#{error.name}']")
    item.closest('.control-group').addClass('error')
    item.after("<p class=\"help-block error\">#{error.message}</p>")

