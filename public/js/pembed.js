
var PEmbed = {
  gistPattern: /https?:\/\/gist\.github\.com\/([\da-f]+)/,

  embed: function(selector) {
    $(selector + ' a').each(function(i, item) {
      var matchData = null;
      var link = $(item);

      if (matchData = link.attr('href').match(PEmbed.gistPattern)) {
        PEmbed._getGistJson(link, matchData);
      }
    });
  },

  _getGistJson: function(link, matchData) {
    $.ajax({
      url: 'http://pembed.heroku.com/gist/' + matchData[1] + '.json',
      dataType: 'jsonp',
      success: function(data) {
        PEmbed._appendGistJson(data, link);
      },
      error: function() {
        console.log('error retrieving gist')
      }
    });
  },

  _appendGistJson: function(data, link) {
    var element = $('<div class="pembed">');
    element.html(data.html);
    link.parent().after(element);
  }
};
