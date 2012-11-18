require 'test_helper'

class ScrapersControllerTest < ActionController::TestCase
  setup do
    @scraper = scrapers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scrapers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scraper" do
    assert_difference('Scraper.count') do
      post :create, scraper: @scraper.attributes
    end

    assert_redirected_to scraper_path(assigns(:scraper))
  end

  test "should show scraper" do
    get :show, id: @scraper.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scraper.to_param
    assert_response :success
  end

  test "should update scraper" do
    put :update, id: @scraper.to_param, scraper: @scraper.attributes
    assert_redirected_to scraper_path(assigns(:scraper))
  end

  test "should destroy scraper" do
    assert_difference('Scraper.count', -1) do
      delete :destroy, id: @scraper.to_param
    end

    assert_redirected_to scrapers_path
  end
end
