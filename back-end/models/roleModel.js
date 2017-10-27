/*
 * fileModel.js contains the file-related functions that interact with the DB
 */

'use strict';

// Initialize globals
var mysql = require( 'mysql' );
var db = require( './dbModule' );
var modelPass = require( './modelPasswords' );
var conn  = mysql.createConnection( {
	host     : 'localhost',
	user     : 'roleModel',
	password : modelPass.fileModelPass,
	database : 'DatabaseNameHere',
} );

/*
 * getUserRoles returns user roles from db
 *
 * @param: uid, user id
 *
 * @return: file path
 */
exports.getFilePath = function( uid, fid ) {
	if ( !uid || !fid ) return "NO RESULTS FOUND\n";
	db.connectDB( conn );
	var sql = "SELECT path FROM file WHERE uid = ? AND fid = ?"; // TODO: Dependant on database structure
	var inserts = [ uid, fid ];
	sql = mysql.format( sql, inserts );
	var filePath = db.queryDB( conn, sql );
	db.closeDB( conn );
	return filePath ? filePath : "NO RESULTS FOUND\n";
}
