require 'test_helper'

class SongsControllerTest < ActionController::TestCase
  setup do
    @song = songs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:songs_all)
  end

  test "should show song" do
    get :show, id: @song.id
    assert_response :success
  end


end
