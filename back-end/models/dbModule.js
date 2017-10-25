/*
 * dbModule.js contains DB functions for the models to access
 */
'use strict';

/*
 * Starts a connection to the DB
 */
exports.connectDB = function( connection ) {
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
exports.queryDB = function( connection, query ) {
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
exports.closeDB = function( connection ) {
	connection.end( function( err ) {
		if ( err ) {
			console.error( 'error ending connection: ' + err);
			return;
		}
	} );
}
