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
 * 
 * @param: uid
 *
 * @return: array of files found
 */
exports.getUserFiles = function( uid ) {
	if ( !uid ) return "NO RESULTS FOUND\n";
	connectDB( conn );
	var sql = "SELECT * FROM file WHERE uid = ?"; // TODO: Dependant on database structure
	var inserts = [ uid ];
	sql = mysql.format( sql, inserts );
	files = queryDB( conn, sql );
	closeDB( conn );
	return files ? files : "NO RESULTS FOUND\n";
}

/*
 * getFilePath searches db for file path if it is viewable by user
 *
 * @param: uid, user id
 * @param: fid, file id
 *
 * @return: file path
 */
exports.getFilePath = function( uid, fid ) {
	if ( !uid || !fid ) return "NO RESULTS FOUND\n";
	connectDB( conn );
	var sql = "SELECT path FROM file WHERE uid = ? AND fid = ?"; // TODO: Dependant on database structure
	var inserts = [ uid, fid ];
	sql = mysql.format( sql, inserts );
	filePath = queryDB( conn, sql );
	closeDB( conn );
	return filePath ? filePath : "NO RESULTS FOUND\n";
}

/*
 * Starts a connection to the DB
 */
function connectDB( connection ) {
	connection.connect( function( err ) {
		if ( err ) {
			console.error( 'error connecting: ' + err);
			return;
		}
	} );
}

/*
 * Send a query to the DB connection
 *
 * @param: connection
 * @param: query, (string) query to send to db
 *
 * @return: query results
 */
function queryDB( connection, query ) {
	connection.query( query, function( err, results, fields ) {
		if ( err ) {
			console.error( 'error fetching results: ' + err );
			return;
		}
		return results;
	} );
}

/*
 * Ends a connection to the DB
 * 
 * @param: connection
 */
function closeDB( connection ) {
	connection.end( function( err ) {
		if ( err ) {
			console.error( 'error ending connection: ' + err);
			return;
		}
	} );
}
