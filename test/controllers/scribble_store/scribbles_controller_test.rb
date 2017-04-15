require 'test_helper'

module ScribbleStore
  class ScribblesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @scribble = scribble_store_scribbles(:one)
    end

    test "should get index" do
      get scribbles_url
      assert_response :success
    end

    test "should get new" do
      get new_scribble_url
      assert_response :success
    end

    test "should create scribble" do
      assert_difference('Scribble.count') do
        post scribbles_url, params: { scribble: { after_image: @scribble.after_image, before_image: @scribble.before_image, requester_email: @scribble.requester_email } }
      end

      assert_redirected_to scribble_url(Scribble.last)
    end

    test "should show scribble" do
      get scribble_url(@scribble)
      assert_response :success
    end

    test "should get edit" do
      get edit_scribble_url(@scribble)
      assert_response :success
    end

    test "should update scribble" do
      patch scribble_url(@scribble), params: { scribble: { after_image: @scribble.after_image, before_image: @scribble.before_image, requester_email: @scribble.requester_email } }
      assert_redirected_to scribble_url(@scribble)
    end

    test "should destroy scribble" do
      assert_difference('Scribble.count', -1) do
        delete scribble_url(@scribble)
      end

      assert_redirected_to scribbles_url
    end
  end
end
