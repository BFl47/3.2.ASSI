require "test_helper"

class MoviegoersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @moviegoer = moviegoers(:one)
  end

  test "should get index" do
    get moviegoers_url
    assert_response :success
  end

  test "should get new" do
    get new_moviegoer_url
    assert_response :success
  end

  test "should create moviegoer" do
    assert_difference('Moviegoer.count') do
      post moviegoers_url, params: { moviegoer: { name: @moviegoer.name, uid: @moviegoer.uid } }
    end

    assert_redirected_to moviegoer_url(Moviegoer.last)
  end

  test "should show moviegoer" do
    get moviegoer_url(@moviegoer)
    assert_response :success
  end

  test "should get edit" do
    get edit_moviegoer_url(@moviegoer)
    assert_response :success
  end

  test "should update moviegoer" do
    patch moviegoer_url(@moviegoer), params: { moviegoer: { name: @moviegoer.name, uid: @moviegoer.uid } }
    assert_redirected_to moviegoer_url(@moviegoer)
  end

  test "should destroy moviegoer" do
    assert_difference('Moviegoer.count', -1) do
      delete moviegoer_url(@moviegoer)
    end

    assert_redirected_to moviegoers_url
  end
end
