require 'test_helper'

class YoutubeapisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get youtubeapis_index_url
    assert_response :success
  end

end
