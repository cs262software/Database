/*
 * roleManager.js contains the functions that handle file requests for user roles
 */

'use strict';

// Initialize globals
var fileModel = require('../models/fileModel.js')
var fs = require( "fs" );

/*
 * getRoles returns the contents of a file if the requesting user has permission
 *
 * @param: req.query.uid, the user id
 *
 * @return: Requested file content
 */
exports.getRoles = function( req, res ) {
	var uid = req.query.uid;
	var fid = "roles";
	var rolePath = fileModel.getFilePath( uid, fid );

	fs.stat( rolePath, function( err, stat ) {
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
