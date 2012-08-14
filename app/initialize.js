/*jshint curly:false, eqnull:true, node:true, laxcomma:true, white:false */

// Uses the "Coffeepress" module to build the necessary javascript
// files for the application

"use strict";

var http = require('http')
  , path = require('path')
  , fs = require('fs')

  // Uglify.js parser (not used if compression is off)
  , jsp = require("uglify-js").parser
  , pro = require("uglify-js").uglify

  // Coffeescript & Settings
  , coffee = require('coffee-script')
  , Coffeepress = require('coffeepress')
  , settings = require(path.join(__dirname, '../settings/index.js'));

// App Stylesheets
new Coffeepress(settings.formloaderCss).run(function(err, data){
  
  if (err) throw err;

  fs.writeFile(path.join(settings.stylesheetDir,'/formloader.css'), data, 'UTF-8', function(){
    console.log('Stylesheets updated');
  });

});

// Build App Javascript
new Coffeepress(settings.formloaderCoffee).run(function(err, data){

  if (err) throw err;

  // Write the formloader.coffee file
  fs.writeFile(path.join(settings.javascriptDir,'/formloader.coffee'), data, 'UTF-8', function() {
    
    var ast, output;

    if (settings.compress) {
      ast = pro.ast_squeeze(pro.ast_mangle(jsp.parse(coffee.compile(data))));
      output = pro.gen_code(ast);
    } else {
      output = coffee.compile(data);
    }
    
    // Rebuild & save the javascript
    fs.writeFile(settings.javascriptDir+'/formloader.js', output, 'UTF-8', function() {
      console.log('Javascript rebuilt');
    });

  });

});

// Build Test Javascript
new Coffeepress(settings.formloaderTestCoffee).run(function(err, data){
  
  if (err) throw err;

  fs.writeFile(path.join(settings.javascriptDir, '/formloader-test.coffee'), data, 'UTF-8', function(){

    var output = coffee.compile(data);

    // Rebuild & save the javascript
    fs.writeFile(settings.javascriptDir + '/formloader-test.js', output, 'UTF-8', function(){
      console.log('Test javascript rebuilt');
    });

  });

});