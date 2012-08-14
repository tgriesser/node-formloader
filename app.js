/*jshint curly:false, eqnull:true, node:true, laxcomma:true, white:false */

// Formloader - a form generation & scaffolding utility
// Author: Tim Griesser <tim@tgriesser.com>
// License: MIT

"use strict";

var express = require('express')
  , http = require('http')
  , path = require('path')
  , fs = require('fs')
  , coffee = require('coffee-script')

  // Coffeepress the app, convert to javascript and optionally compress
  , _ = require('underscore')
  , BuildIt = require('buildit')
  
  // The Base Express App & Api
  , app = express()
  , api = require('./app/api')
  , port = 3000
  ;

// Init the app, generating all coffee, js & css assets
require('./app/initialize');

// Generate the Express App
app.configure(function(){
  app.set('port', process.env.PORT || port);
  app.use(express.favicon());
  app.use(express.logger('dev'));
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(express.compress());
  app.use(express['static'](path.join(__dirname, 'public')));
  app.use(app.router);
});

// Development Configuration
app.configure('development', function(){
  app.use(express.errorHandler());
});

// Get the Application, as a string
app.get('/api/bootstrap', function(req, res){
  res.set('Content-Type', 'text/javascript');
  res.send(200, api.Apps);
});

// Create a new application
app.post('/api/applications', function(req, res) {
  res.set('Content-Type', 'text/javascript');
  api.createApp(req.body.name, function(err, msg) {
    res.send({
      id : req.body.name
    });
  });
});

// Delete an application
app['delete']('/api/applications/:name', function(req, res) {
  res.set('Content-Type', 'text/javascript');
  api.deleteApp(req.params.name, function(err, msg) {
    res.send(200, {});
  });
});

// POST, PUT, DELETE calls for items
app.all('/api/:app/:base?/:item?', function(req, res) {
  
  var id;

  var checkKey = function(){
    if (_.isEmpty(req.body.key)) {
      return res.send(400, ["The key isn't set"]);
    }
  };

  switch(req.route.method) {
    case 'post':
      checkKey();
      id = _.clone(req.body.key);
      api.createItem(req.params.app, req.params.base, req.body.key, req.body, function(err) {
        if (err) res.send(400, [err.message]);
        res.json({
          id : id
        });
      });
    break;
    case 'put':
      checkKey();
      id = _.clone(req.body.key);
      api.updateItem(req.params.app, req.params.base, req.params.item, req.body, function(err){
        if (err) res.send(400, [err.message]);
        res.json({
          id : id
        });
      });
    break;
    case 'delete':
      api.deleteItem(req.params.app, req.params.base, req.params.item, function(err){
        if (err) res.send(400, [err.message]);
        res.send(200, {});
      });
    break;
  }
});

// Test Path
app.get('/test/:app/:type/:item', function(req, res){
  fs.readFile('./views/test.html', function (err, data){
    if (err) throw err;
    res.set('Content-Type', 'text/html');
    res.send(data.toString());
  });
});

// All requests for the app (non-api) will send back the regular page
app.all('/:app?/:type?/:item?', function(req, res){
  fs.readFile('./views/index.html', function (err, data) {
    if (err) throw err;
    res.set('Content-Type', 'text/html');
    res.send(data.toString());
  });
});

// Create the Formloader Application
var server = http.createServer(app).listen(app.get('port'), function() {
  console.log("Express server listening on port " + app.get('port'));
});
