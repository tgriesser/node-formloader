exports.formloader = {
  "forms": {
    "fieldsets": {
      "fields": ["key","fields","buttons","validations","decorators"],
      "buttons": ["save","preview"],
      "templates": "ace"
    },
    "fields": {
      "fields": ["key","validations","decorators"],
      "buttons": ["save","preview"]
    },
    "buttons": {
      "fields": ["key","validations","decorators"]
    },
    "validations": {
      "fields": ["key","functionBody"],
      "templates": ""
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
    "ace": "<div class=\"control-group\">\n<label class=\"control-label\"><%= data.label %></label>\n<div class=\"controls\">\n  <div id=\"editor\"></div>\n  <span class=\"help-block\">The <%= data.meta.name %> block should not include a semicolon at the end</span>\n</div>\n</div>"
  }
};