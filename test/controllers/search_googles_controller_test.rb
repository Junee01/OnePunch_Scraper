require 'test_helper'

class SearchGooglesControllerTest < ActionController::TestCase
  setup do
    @search_google = search_googles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:search_googles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create search_google" do
    assert_difference('SearchGoogle.count') do
      post :create, search_google: { issue_date: @search_google.issue_date, issue_rank: @search_google.issue_rank, issue_time: @search_google.issue_time, issue_title: @search_google.issue_title, issue_today_total: @search_google.issue_today_total }
    end

    assert_redirected_to search_google_path(assigns(:search_google))
  end

  test "should show search_google" do
    get :show, id: @search_google
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @search_google
    assert_response :success
  end

  test "should update search_google" do
    patch :update, id: @search_google, search_google: { issue_date: @search_google.issue_date, issue_rank: @search_google.issue_rank, issue_time: @search_google.issue_time, issue_title: @search_google.issue_title, issue_today_total: @search_google.issue_today_total }
    assert_redirected_to search_google_path(assigns(:search_google))
  end

  test "should destroy search_google" do
    assert_difference('SearchGoogle.count', -1) do
      delete :destroy, id: @search_google
    end

    assert_redirected_to search_googles_path
  end
end
