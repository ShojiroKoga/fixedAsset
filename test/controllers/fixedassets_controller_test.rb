require 'test_helper'

class FixedassetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fixedasset = fixedassets(:one)
  end

  test "should get index" do
    get fixedassets_url
    assert_response :success
  end

  test "should get new" do
    get new_fixedasset_url
    assert_response :success
  end

  test "should create fixedasset" do
    assert_difference('Fixedasset.count') do
      post fixedassets_url, params: { fixedasset: { acquisition_date: @fixedasset.acquisition_date, asset_number: @fixedasset.asset_number, case_name: @fixedasset.case_name, create_date: @fixedasset.create_date, etc_content: @fixedasset.etc_content, modeltype_name: @fixedasset.modeltype_name, place_detail: @fixedasset.place_detail, place_summary: @fixedasset.place_summary, serial_number: @fixedasset.serial_number } }
    end

    assert_redirected_to fixedasset_url(Fixedasset.last)
  end

  test "should show fixedasset" do
    get fixedasset_url(@fixedasset)
    assert_response :success
  end

  test "should get edit" do
    get edit_fixedasset_url(@fixedasset)
    assert_response :success
  end

  test "should update fixedasset" do
    patch fixedasset_url(@fixedasset), params: { fixedasset: { acquisition_date: @fixedasset.acquisition_date, asset_number: @fixedasset.asset_number, case_name: @fixedasset.case_name, create_date: @fixedasset.create_date, etc_content: @fixedasset.etc_content, modeltype_name: @fixedasset.modeltype_name, place_detail: @fixedasset.place_detail, place_summary: @fixedasset.place_summary, serial_number: @fixedasset.serial_number } }
    assert_redirected_to fixedasset_url(@fixedasset)
  end

  test "should destroy fixedasset" do
    assert_difference('Fixedasset.count', -1) do
      delete fixedasset_url(@fixedasset)
    end

    assert_redirected_to fixedassets_url
  end
end
