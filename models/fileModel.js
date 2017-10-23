/*
 * fileModel.js contains the functions that interact with the DB
 */

'use strict';

var mysql = require( 'mysql-model' );
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
	var file = new conn( { tableName: "file" } ); // mysql file model
	file.find( 'all', { where: "uid = " + uid, }, function( err, rows ) {
			files = rows;
	} );
	return files;
}
