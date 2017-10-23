/**
 * server.js runs the main nodejs express server
 */

var express = require( 'express' );
var app = express(); 
var routes = require( './routes/routes' );

routes( app );

app.listen( 8000 );
