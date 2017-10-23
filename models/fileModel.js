/*
 * fileModel.js contains the functions that interact with the DB
 */

'use strict';

var mysql = require( 'mysql' );
var modelPass = require( './modelPasswords' );
var conn  = mysql.createConnection( {
	host     : 'localhost',
	user     : 'fileModel',
	password : modelPass.fileModelPass,
	database : 'DatabaseNameHere',
} );

/*
 * getFilesByUID searches the db for files viewable by uid
 */
exports.getFilesByUid = function( uid ) {
	var files = []; // Store file results here
	conn.connect( function( err ) {
		if ( err ) {
			console.error( 'error connecting: ' + err.stack);
			return;
		}
	} );
	var sql = "SELECT * FROM file HWERE uid = ?";
	var inserts = [ uid ];
	sql = mysql.format( sql, inserts );
	conn.query( sql, function( err, results, fields ) {
		if ( err ) {
			console.error( 'error fetching results: ' + err );
			return;
		}
		files = results;
	} );
	conn.end( function( err ) {
		if ( err ) {
			console.error( 'error ending connection: ' + err.stack);
			return;
		}
	} );
	return files;
}
