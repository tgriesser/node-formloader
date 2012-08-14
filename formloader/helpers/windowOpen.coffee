Helpers.windowOpen = (opts = {}, callback, context) ->
  callback ?= () ->
  _.defaults opts,
    url : 'about:blank'
    windowName : 'OAuthConnect'
    windowOptions : 'location=0,status=0,width=600,height=400'
  child = window.open(opts.url, opts.windowName, opts.windowOptions);
  authInterval = window.setInterval( ->
    if child.closed
      window.clearInterval(authInterval)
      callback.call(context)
  , 1000)