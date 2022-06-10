require "test_helper"

class InsuredsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @insured = insureds(:one)
  end

  test "should get index" do
    get insureds_url
    assert_response :success
  end

  test "should get new" do
    get new_insured_url
    assert_response :success
  end

  test "should create insured" do
    assert_difference("Insured.count") do
      post insureds_url, params: { insured: { TIN_no: @insured.TIN_no, address: @insured.address, age: @insured.age, birthdate: @insured.birthdate, civil_status: @insured.civil_status, cooperative_branch_id: @insured.cooperative_branch_id, cooperative_id: @insured.cooperative_id, first_name: @insured.first_name, gender: @insured.gender, id_no: @insured.id_no, id_type: @insured.id_type, last_name: @insured.last_name, middle_name: @insured.middle_name, nationality: @insured.nationality, place_of_birth: @insured.place_of_birth, premium: @insured.premium, suffix: @insured.suffix } }
    end

    assert_redirected_to insured_url(Insured.last)
  end

  test "should show insured" do
    get insured_url(@insured)
    assert_response :success
  end

  test "should get edit" do
    get edit_insured_url(@insured)
    assert_response :success
  end

  test "should update insured" do
    patch insured_url(@insured), params: { insured: { TIN_no: @insured.TIN_no, address: @insured.address, age: @insured.age, birthdate: @insured.birthdate, civil_status: @insured.civil_status, cooperative_branch_id: @insured.cooperative_branch_id, cooperative_id: @insured.cooperative_id, first_name: @insured.first_name, gender: @insured.gender, id_no: @insured.id_no, id_type: @insured.id_type, last_name: @insured.last_name, middle_name: @insured.middle_name, nationality: @insured.nationality, place_of_birth: @insured.place_of_birth, premium: @insured.premium, suffix: @insured.suffix } }
    assert_redirected_to insured_url(@insured)
  end

  test "should destroy insured" do
    assert_difference("Insured.count", -1) do
      delete insured_url(@insured)
    end

    assert_redirected_to insureds_url
  end
end
