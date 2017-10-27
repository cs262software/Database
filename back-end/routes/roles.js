/*
 * roles.js Maintains the user role route information
 *
 */

'use strict';

var express = require('express');
var router = express.Router();

var roleManager = require( '../controllers/roleManager' );

//GET user roles
router.get('/', function(req, res, next) {
	// Call the database and return roles as JSON
	roleManager.getRoles( req, res )
} );

module.exports = router;
