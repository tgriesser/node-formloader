exports.formloader = {
  "forms": {
    "fieldsets": {
      "templates": "",
      "fields": ["key","fields","buttons","validations","decorators"],
      "buttons": ["save","preview"]
    },
    "fields": {
      "fields": ["key","validations","decorators"],
      "buttons": ["save","preview"],
      "templates": ""
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
      "templates": "bootInput",
      "meta": {
        "help-block": "The name used when referring to the form in other locations"
      },
      "validations": ["required","alphaUnderscore"]
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
    "bootInput": "<div id=\"meg\">\n  <input class=\"tim\"/>\n</div>"
  }
};