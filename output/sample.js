exports.sample = {
  "forms": {
    "logs": {
      "fields": ["email","password"],
      "buttons": ["submit"],
      "decorators": ["formHorizontal"],
      "attributes": {
        "class": "form-horizontal"
      }
    }
  },
  "buttons": {
    "submit": {
      "tagName": "a",
      "value": "Sign In",
      "attributes": {
        "class": "btn"
      }
    }
  },
  "fields": {
    "password": {
      "decorators": ["bootstrap2-form"],
      "attributes": {
        "name": "password"
      },
      "validations": ["required"],
      "type": "password"
    },
    "email": {
      "label": "Email Address",
      "decorators": ["bootstrap2-form"],
      "attributes": {
        "name": "email"
      },
      "validations": ["required"]
    },
    "remember_me": {
      "decorators": ["bootstrap2-form"],
      "attributes": {
        "type": "checkbox",
        "checked": "checked"
      }
    }
  },
  "validations": {
    "required": function (){}
  },
  "fieldsets": {
  
  },
  "decorators": {
    "bootstrap2-form": function (){
  var $form = $("<div class='control-group'><label class='control-label'>Key:</label><div class='controls'></div></div>");
  $form.find('.controls').append(this.$el);
  this.$el = $form;
},
    "formHorizontal": function () {
  this.$el.addClass('form-horizontal');
},
    "checkbox": function (){
  this.$el.attr('name', 'checky');
},
    "item": function (){
  var tim;
  tim = 'two';
}
  },
  "templates": {
  
  }
};