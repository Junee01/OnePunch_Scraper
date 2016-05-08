require 'test_helper'

class SearchDaumsControllerTest < ActionController::TestCase
  setup do
    @search_daum = search_daums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:search_daums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create search_daum" do
    assert_difference('SearchDaum.count') do
      post :create, search_daum: { issue_date: @search_daum.issue_date, issue_rank: @search_daum.issue_rank, issue_time: @search_daum.issue_time, issue_title: @search_daum.issue_title, issue_today_total: @search_daum.issue_today_total }
    end

    assert_redirected_to search_daum_path(assigns(:search_daum))
  end

  test "should show search_daum" do
    get :show, id: @search_daum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @search_daum
    assert_response :success
  end

  test "should update search_daum" do
    patch :update, id: @search_daum, search_daum: { issue_date: @search_daum.issue_date, issue_rank: @search_daum.issue_rank, issue_time: @search_daum.issue_time, issue_title: @search_daum.issue_title, issue_today_total: @search_daum.issue_today_total }
    assert_redirected_to search_daum_path(assigns(:search_daum))
  end

  test "should destroy search_daum" do
    assert_difference('SearchDaum.count', -1) do
      delete :destroy, id: @search_daum
    end

    assert_redirected_to search_daums_path
  end
end
