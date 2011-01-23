require 'test_helper'
require 'pembed'

class PEmbedTest < MiniTest::Unit::TestCase

  def test_should_get_index
    app = PEmbed.new
    request = Rack::MockRequest.new(app)
    response = request.get('/')
    assert_equal(200, response.status)
  end

end
