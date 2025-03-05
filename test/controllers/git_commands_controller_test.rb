require "test_helper"

class GitCommandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get git_commands_index_url
    assert_response :success
  end

  test "should get create" do
    get git_commands_create_url
    assert_response :success
  end
end
