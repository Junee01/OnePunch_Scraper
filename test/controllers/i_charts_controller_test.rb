require 'test_helper'

class IChartsControllerTest < ActionController::TestCase
  setup do
    @i_chart = i_charts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:i_charts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create i_chart" do
    assert_difference('IChart.count') do
      post :create, i_chart: { iChart_album: @i_chart.iChart_album, iChart_artist: @i_chart.iChart_artist, iChart_etm: @i_chart.iChart_etm, iChart_rank: @i_chart.iChart_rank, iChart_song: @i_chart.iChart_song }
    end

    assert_redirected_to i_chart_path(assigns(:i_chart))
  end

  test "should show i_chart" do
    get :show, id: @i_chart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @i_chart
    assert_response :success
  end

  test "should update i_chart" do
    patch :update, id: @i_chart, i_chart: { iChart_album: @i_chart.iChart_album, iChart_artist: @i_chart.iChart_artist, iChart_etm: @i_chart.iChart_etm, iChart_rank: @i_chart.iChart_rank, iChart_song: @i_chart.iChart_song }
    assert_redirected_to i_chart_path(assigns(:i_chart))
  end

  test "should destroy i_chart" do
    assert_difference('IChart.count', -1) do
      delete :destroy, id: @i_chart
    end

    assert_redirected_to i_charts_path
  end
end
