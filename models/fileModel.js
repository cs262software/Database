/*
 * fileModel.js contains the functions that interact with the DB
 */

'use strict';

// Initialize globals
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
	connectDB( conn ); // TODO: Try-catch sort of thing
	var sql = "SELECT * FROM file HWERE uid = ?";
	var inserts = [ uid ];
	sql = mysql.format( sql, inserts );
	files = queryDB( conn, sql );
	closeDB( conn );
	return files;
}

/*
 * Starts a connection to the DB
 */
function connectDB( connection ) {
	connection.connect( function( err ) {
		if ( err ) {
			console.error( 'error connecting: ' + err.stack);
			return;
		}
	} );
}

/*
 * Send a query to the DB connection
 *
 * return results
 */
function queryDB( connection, query ) {
	connection.query( query, function( err, results, fields ) {
		if ( err ) {
			console.error( 'error fetching results: ' + err );
			return;
		}
		files = results;
	} );
}

/*
 * Ends a connection to the DB
 */
function closeDB( connection ) {
	connection.end( function( err ) {
		if ( err ) {
			console.error( 'error ending connection: ' + err.stack);
			return;
		}
	} );
}
