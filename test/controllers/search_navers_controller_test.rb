require 'test_helper'

class SearchNaversControllerTest < ActionController::TestCase
  setup do
    @search_naver = search_navers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:search_navers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create search_naver" do
    assert_difference('SearchNaver.count') do
      post :create, search_naver: { issue_date: @search_naver.issue_date, issue_rank: @search_naver.issue_rank, issue_time: @search_naver.issue_time, issue_title: @search_naver.issue_title, issue_today_total: @search_naver.issue_today_total }
    end

    assert_redirected_to search_naver_path(assigns(:search_naver))
  end

  test "should show search_naver" do
    get :show, id: @search_naver
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @search_naver
    assert_response :success
  end

  test "should update search_naver" do
    patch :update, id: @search_naver, search_naver: { issue_date: @search_naver.issue_date, issue_rank: @search_naver.issue_rank, issue_time: @search_naver.issue_time, issue_title: @search_naver.issue_title, issue_today_total: @search_naver.issue_today_total }
    assert_redirected_to search_naver_path(assigns(:search_naver))
  end

  test "should destroy search_naver" do
    assert_difference('SearchNaver.count', -1) do
      delete :destroy, id: @search_naver
    end

    assert_redirected_to search_navers_path
  end
end
