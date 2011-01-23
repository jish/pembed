$LOAD_PATH.unshift('lib')

require 'rack/contrib/jsonp'

require 'pembed'

use Rack::JSONP
run PEmbed
