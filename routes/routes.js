/*
 * routes.js Maintains the routing information for the server.
 */

'use strict';

module.exports = function( app ) {
	var bodyParser = require( "body-parser" );
	app.use( bodyParser.json() ); // support json encoded bodies
	app.use( bodyParser.urlencoded( { extended: true } ) ) // url encoded bodies

	// Home page
	app.route( '/' )
		.get( function( req, res ) { res.send( "WELCOME" ); } );

	// fileManager
	var fileManager = require( '../controllers/fileManager' );
	app.route( '/myfiles' )
		.get( fileManager.listMyFiles );
//	app.route( '/files' )
//		.get( fileManager.getFile );

	// URL not found
	app.use( function( req, res ) {
      res.status(404).send( { url: '404' + req.originalUrl + ' not found' } )
    } );
};
