/*
 * fileManager.js contains the functions that handle file content related tasks
 */

'use strict';

var fileModel = require('../models/fileModel.js')

/*
 * listMyFiles lists the files that a give user has access to
 */
exports.listMyFiles = function( req, res ) {
	var uid = req.body.uid;
	var myFiles = fileModel.getFilesByUID( uid );
	res.send( myFiles );
}
