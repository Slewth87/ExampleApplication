var assert = require('assert');
var utils = require("../modules/utils")

describe('utils', function() {
  describe('#flip()', function() {
    it('should return the words in reverse order', function() {
      assert.equal(utils.flip("jeremy","bearamy"), "bearamy jeremy");
    });
  });

});