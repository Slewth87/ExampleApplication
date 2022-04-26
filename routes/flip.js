var express = require('express');
var router = express.Router();
var utils = require('../modules/utils')

/* GET home page. */
router.get('/', function(req, res, next) {
  res.set('X-Frame-Options', 'DENY')
  res.set('X-Content-Type-Options', 'nosniff')
  res.set('Strict-Transport-Security', 'max-age=31536000; includeSubDomains; preload')
  res.set('Cache-Control', 'no-cache, no-store, must-revalidate')
  res.set('Content-Security-Policy', "default-src 'none'; script-src 'self'; connect-src 'self'; img-src 'self'; style-src 'self'; base-uri 'self'; form-action 'self'; frame-ancestors 'none'")
  res.redirect("/reverser/flip");
});


/* GET home page. */
router.get('/flip', function(req, res, next) {
  var result = 0
  var {word1, word2} = req.query
  if(word1 && word12) {
      result = word2 + " " + word1
  }
  res.set('X-Frame-Options', 'DENY')
  res.set('X-Content-Type-Options', 'nosniff')
  res.set('Strict-Transport-Security', 'max-age=31536000; includeSubDomains; preload')
  res.set('Cache-Control', 'no-cache, no-store, must-revalidate')
  res.set('Content-Security-Policy', "default-src 'none'; script-src 'self'; connect-src 'self'; img-src 'self'; style-src 'self'; base-uri 'self'; form-action 'self'; frame-ancestors 'none'")
  res.render('compute', { title: 'flip' ,result:result, word1, word2});

});

module.exports = router;