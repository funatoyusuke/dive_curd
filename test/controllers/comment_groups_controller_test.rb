require 'test_helper'

class CommentGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get comment_groups_create_url
    assert_response :success
  end

end
