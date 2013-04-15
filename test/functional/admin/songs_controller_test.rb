require 'test_helper'

class Admin::SongsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  context "authenticated user" do
    setup do
      @controller.stubs(:authenticate_admin_user!).returns("whatever")
    end

    should "get get new" do
      get :new
      assert_response :success
    end
  end
  # test "should get edit" do
  #   get :edit, id: @song
  #   assert_response :success
  # end

  # test "should update song" do
  #   put :update, id: @song, song: { album: @song.album, artist: @song.artist, title: @song.title, year: @song.year }
  #   assert_redirected_to song_path(assigns(:song))
  # end

  # test "should destroy song" do
  #   assert_difference('Song.count', -1) do
  #     delete :destroy, id: @song
  #   end

  #   assert_redirected_to songs_path
  # end

  # test "should create song" do
  #   assert_difference('Song.count') do
  #     post :create, song: { album: @song.album, artist: @song.artist, lyrics: @song.lyrics, title: @song.title, year: @song.year }
  #   end

  #   assert_redirected_to song_path(assigns(:song))
  # end

end
