# Base object for all items with Select2 elements
Pages.baseObject = V.extend
  
  # The shared events for all pages
  events : 
    "click a[data-addAttribute]" : "addAttribute"
    "click a[data-removeAttribute]" : "removeAttribute"
    "click a[data-addMeta]" : "addMeta"
    "click a[data-removeMeta]" : "removeMeta"
    "click li.select2-search-choice" : "clickTag"
    
    "submit form"   : (e) ->
      e.preventDefault()
      @saveForm e, null, (m) =>
        if m.id?
          Backbone.history.navigate("/#{app.m.application.id}/#{@type}/#{m.id}", {trigger:true})

  # Opens an item for editing
  clickTag : (e) ->
    e.preventDefault()
    item = $(e.currentTarget).closest('div').siblings('input').attr('id')
    $("##{item}").select2('close')
    Helpers.windowOpen
      url : "/#{app.m.application.id}/#{item}/#{$(e.currentTarget).text().trim()}"
      windowName : item
      windowOptions : 'location=0,status=0,width=900,height=740'
    , () ->
      console.log('callback')
  
  # Initialize an 'ace' editor on the appropriate items.
  initAce : () ->
    $textarea = @$('textarea').hide()
    @editor = ace.edit(@$("#editor")[0])
    
    aSess = @editor.getSession()
    aSess.setTabSize(2)
    aSess.setUseSoftTabs(true)
    aSess.setValue($textarea.val())
    aSess.setUseWrapMode(true)
    aSess.setMode("ace/mode/javascript")
    aSess.setUseWorker(false)
    aSess.on 'change', () =>
      $textarea.val(@editor.getSession().getValue())

  # Initializes a select for one of the main items  
  # (fieldset, field, button, decorator, validation)
  initSelect : (item, model) ->

    # Initialize the select2
    @$("##{item}").val(model.get(item)).select2
      
      # Allow multiple items for each of the initSelect types
      multiple : true
      
      # Creates the list of things that we're using
      query : (query) ->
        data = {
          results : app.c[item].reduce (memo, value, key) -> 
            memo.push({id : value.id, text: value.id})
            memo
          , []
        }
        query.callback(data)

      # Creates the initial tags based on the model
      initSelection : (element, callback) ->
        custom = 0
        callback(_.reduce model.get(item), (memo, value, key) ->
          if /function\s?\(/.test(value)
            memo.push({id: value, text:'customFn:'+custom})
            custom++
          else
            memo.push({id: value, text:value})
          memo
        , [])

    @$("##{item}").on "change", () =>
      @$("##{item}_val").html($("##{item}").val()) 
    
    @$("##{item}").select2("container").find("ul.select2-choices").sortable
        containment: 'parent',
        start: () =>
          @$("##{item}").select2("onSortStart")
        update: () =>
          @$("##{item}").select2("onSortEnd")
    
    this

  template : (params) ->
    return Templates[@type](params);

  addAttribute : (e) ->
    e.preventDefault()
    @$("#attributes").append(Templates['partials/attrRow']({}))

  removeAttribute : (e) ->
    e.preventDefault()
    $(e.currentTarget).closest('div.row').remove()

  addMeta : (e) ->
    e.preventDefault()
    @$("#meta").append(Templates['partials/metaRow']({}))

  removeMeta : (e) ->
    e.preventDefault()
    $(e.currentTarget).closest('div.row').remove()

  renderAttr : () ->
    $attr = @$("#attributes");
    $attr.append(Templates['partials/attr']({
      item : @item
    }))
    _.each @model.get('attributes'), (value, key) ->
      $attr.append(Templates['partials/attrRow']({
        value : value,
        key : key
      }))
    , @
    this

  renderMeta : () ->
    $meta = @$("#meta")
    $meta.append(Templates['partials/meta']())
    _.each @model.get('meta'), (value, key) ->
      $meta.append(Templates['partials/metaRow']({
        value : value,
        key : key
      }))
    , @
    this

  render : () ->
    try
      # Set the current page to know what to destroy on navigate,
      # doubles as a reference for the jQuery loop
      LastPage = CurrentPage
      CurrentPage = this
      
      @$el.html(@template(@model.toJSON()))
      
      @$('[data-select2]').each () ->
        val = $(this).attr('data-select2')
        $(this).html(Templates['partials/select2']({
          ucType : val.charAt(0).toUpperCase() + val.slice(1)
          type : val
        }))
        CurrentPage.initSelect.call(CurrentPage, val, CurrentPage.model)

      if @item? then @renderAttr()
      @renderMeta()
    catch e
      @$el.html(Templates['errors/404-app'])
    this

# A list of all applications
Pages['application/list'] = V.extend
  template : Templates['app/list']
  initialize : () ->
    @collection = app.c.applications
  render : () ->
    @$el.html(@template({
      apps : @collection.toJSON()
    }))
    this
