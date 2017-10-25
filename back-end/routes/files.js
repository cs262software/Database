/*
 * files.js Maintains the file system routing information
 */

var express = require( 'express' );
var router = express.Router();
var fileManager = require( '../controllers/fileManager' );

router.get( '/', function( req, res, next ) {
	fileManager.getFile( req, res )
} );

module.exports = router;
