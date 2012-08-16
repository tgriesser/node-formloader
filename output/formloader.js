exports.formloader = {
  "forms": {
    "fieldsets": {
      "templates": "",
      "fields": ["key","fields","buttons","validations","decorators"],
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
      "templates": "bootstrapInput5",
      "meta": {
        "help-block": "The name used when referring to the form in other locations"
      },
      "validations": ["required","alphaUnderscore"]
    },
    "functionBlock": {
      "templates": "aceFunction"
    }
  },
  "fieldsets": {
  
  },
  "buttons": {
    "save": {
      "templates": "bootstrapInput5"
    },
    "preview": {
    
    }
  },
  "validations": {
  
  },
  "decorators": {
    "item": ""
  },
  "templates": {
    "bootstrapInput5": "<div id=\"meg\">\n  <input class=\"tims\"/>\n</div>",
    "aceTemplate": "<div class=\"control-group\">\n  <label class=\"control-label\">Template Body</label>\n  <div class=\"controls\">\n    <div id=\"editor\"></div>\n    <span class=\"help-block\">The template to use for the form item</span>\n  </div>\n</div>",
    "aceFunction": "<div class=\"control-group\">\n	<label class=\"control-label\">Function Body</label>\n	<div class=\"controls\">\n		<div id=\"editor\"></div>\n		<div class=\"clearfix\"></div>\n		<span class=\"help-block\">The function block should not include a semicolon at the end</span>\n	</div>\n</div>"
  }
};