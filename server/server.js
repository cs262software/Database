/**
 * server.js runs the main nodejs express server
 *
 * run server with 'node server.js'
 */

var express = require( 'express' );
var app = express(); 
var routes = require( './routes/routes' );

routes( app );

app.listen( 8000 );
