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
  , BuildIt = require('buildit');
  
// The Base Express App & Api
var app = express()
  , api = require('./app/api')
  , port = 3000;

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

// Handle the API calls with a single function
app.all('/api/:app/:base?/:item?', function(req, res) {

  res.set('Content-Type', 'text/javascript');
  switch(req.route.method) {
    case 'post':
      try {
        api.createItem(req.params.app, req.params.base, req.body.key, req.body);
        res.send(200, {
          id : req.body.key
        });
      } catch (e) {
        res.send(400, e.message);
      }
    break;
    case 'put':
      try {
        res.send(200, api.updateItem(req.params.app, req.params.base, req.params.item, req.body));
      } catch (e) {
        console.log(e.message);
        res.send(400, e.message);
      }
    break;
    case 'delete':
      console.log(req);
      res.send(200, '');
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
