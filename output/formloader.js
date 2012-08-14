exports.formloader = {
  "forms": {
    "fieldsets": {
      "fields": ["key","fields","buttons","decorators","validations"],
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
  
  }
};