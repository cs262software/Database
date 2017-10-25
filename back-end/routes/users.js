/*
 * users.js Maintains routing information for user handling
 */

'use strict';

var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
	// Normally you'd call a function (like I do in files.js)
	res.json([{
		id: 1,
		username: "samsepi0l"
	}, {
		id: 2,
		username: "D0loresH4ze"
	}]);
});

module.exports = router;
