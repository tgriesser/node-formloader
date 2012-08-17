exports.formloader = {
  "forms": {
    "fieldsets": {
      "templates": "",
      "fields": ["key","fields","fieldsets","buttons","validations","decorators"],
      "buttons": ["save","preview"]
    },
    "fields": {
      "templates": "",
      "fields": ["key","validations","decorators"],
      "buttons": ["save","preview"]
    },
    "buttons": {
      "fields": ["key","validations","decorators"]
    },
    "validations": {
      "fields": ["key"],
      "templates": ""
    },
    "decorators": {
      "fields": ["key"]
    },
    "forms": {
      "templates": "",
      "fields": ["key","fieldsets","fields","buttons","validations","decorators"],
      "buttons": ["save","preview"]
    }
  },
  "fields": {
    "validations": {
      "templates": "aceTemplate",
      "attributes": {
        "data-select2": "validations"
      }
    },
    "decorators": {
      "templates": "",
      "attributes": {
        "data-select2": "decorators"
      }
    },
    "buttons": {
      "templates": "",
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
        "help-block": "The name used when referring to the form in other locations"
      },
      "validations": ["required","alphaUnderscore"]
    },
    "functionBlock": {
      "templates": "aceFunction"
    },
    "fields": {
      "templates": "",
      "attributes": {
        "data-select2": "fields"
      }
    }
  },
  "fieldsets": {
  
  },
  "buttons": {
    "save": {
      "templates": ""
    },
    "preview": {
    
    }
  },
  "validations": {
  
  },
  "decorators": {
  
  },
  "templates": {
    "aceFunction": "<div class=\"control-group\">\n	<label class=\"control-label\">Function Body</label>\n	<div class=\"controls\">\n		<div id=\"editor\"></div>\n		<div class=\"clearfix\"></div>\n		<span class=\"help-block\">The function block should not include a semicolon at the end</span>\n	</div>\n</div>",
    "aceTemplate": "<div class=\"control-group\">\n  <label class=\"control-label\">Template Body</label>\n  <div class=\"controls\">\n    <div id=\"editor\"></div>\n    <span class=\"help-block\">The template to use for the form item</span>\n  </div>\n</div>"
  }
};