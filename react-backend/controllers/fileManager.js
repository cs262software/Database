/*
 * fileManager.js contains the functions that handle file content related tasks
 */

'use strict';

// Initialize globals
var fileModel = require('../models/fileModel.js')
var fs = require( "fs" );

/*
 * listMyFiles lists the files that a give user has access to
 *
 * @param: req.query.uid, the user id
 *
 * @return: List of files
 */
exports.listMyFiles = function( req, res ) {
	var uid = req.query.uid;
	var myFiles = fileModel.getUserFiles( uid );
	res.send( myFiles );
}

/*
 * getFile returns the contents of a file if the requesting user has permission
 *
 * @param: req.query.uid, the user id
 * @param: req.query.fid, the file id
 *
 * @return: Requested file content
 */
exports.getFile = function( req, res ) {
	var uid = req.query.uid;
	var fid = req.query.fid;
	var filePath = fileModel.getFilePath( uid, fid );

	fs.stat( filePath, function( err, stat ) {
		if( err == null ) {
			var content = fs.readFileSync( filePath, "utf-8" ); 
			res.send( content );
		} else if( err.code == 'ENOENT' ) {
			console.log( err.code );
			res.send( 'FILE DOES NOT EXIST' );
		} else {
			console.log( 'FILE ERROR: ', err.code );
		}
	} );
}
