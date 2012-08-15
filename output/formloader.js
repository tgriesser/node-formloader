exports.formloader = {
  "forms": {
    "fieldsets": {
      "fields": ["key","fields","buttons","validations","decorators"],
      "buttons": ["save","preview"]
    },
    "fields": {
      "fields": ["key","validations","decorators"],
      "buttons": ["save","preview"]
    },
    "buttons": {
      "fields": ["key","validations","decorators"]
    },
    "validations": {
      "fields": ["key","functionBody"]
    },
    "decorators": {
      "fields": ["key","functionBody"]
    },
    "forms": {
      "fields": ["key","fieldsets","fields","buttons","validations","decorators"],
      "buttons": ["save","preview"]
    }
  },
  "fields": {
    "validations": {
      "attributes": {
        "data-select2": "validations"
      }
    },
    "fields": {
      "attributes": {
        "data-select2": "fields"
      }
    },
    "decorators": {
      "attributes": {
        "data-select2": "decorators"
      }
    },
    "buttons": {
      "attributes": {
        "data-select2": "buttons"
      }
    },
    "fieldsets": {
      "attributes": {
        "data-select2": "fieldsets"
      }
    },
    "key": {
      "meta": {
        "help": "The name used when referring to the <%= type %> in other locations"
      }
    },
    "functionBody": {
      "attributes": {
        "name": "value"
      }
    }
  },
  "fieldsets": {
  
  },
  "buttons": {
    "save": {
    
    },
    "preview": {
    
    }
  },
  "validations": {
  
  },
  "decorators": {
    "item": function (){
  return 'eats';
}
  },
  "templates": {
    "ii": "<form class=\"form-horizontal\">\n<fieldset>\n  <legend>Legend text</legend>\n  <div class=\"control-group\">\n    <label class=\"control-label\" for=\"input01\">Text input</label>\n    <div class=\"controls\">\n      <input type=\"text\" class=\"input-xlarge\" id=\"input01\">\n      <p class=\"help-block\">Supporting help text</p>\n    </div>\n  </div>\n</fieldset>\n</form>"
  }
};