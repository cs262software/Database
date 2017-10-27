/*
 * roleManager.js contains the functions that handle file content related tasks
 */

'use strict';

// Initialize globals
var fileModel = require('../models/roleModel.js')
var fs = require( "fs" );

/*
 * getRoles returns the groups/roles of a requesting user
 *
 * @param: req.query.uid, the user id
 *
 * @return: Requested file content
 */
exports.getFile = function( req, res ) {
	var uid = req.query.uid;
	var roles = roleModel.getUserRoles( uid );

	fs.stat( filePath, function( err, stat ) {
		if( err == null ) {
			var content = fs.readFileSync( filePath, "utf-8" ); 
			res.send( content );
		} else if( err.code == 'ENOENT' ) {
			console.log( err.code );
			res.send( 'FILE DOES NOT EXIST\nuid: ' + uid + "\nfid: " + fid );
		} else {
			console.log( 'FILE ERROR: ', err.code );
		}
	} );
}
