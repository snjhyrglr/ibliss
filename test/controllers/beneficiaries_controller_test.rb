require "test_helper"

class BeneficiariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @beneficiary = beneficiaries(:one)
  end

  test "should get index" do
    get beneficiaries_url
    assert_response :success
  end

  test "should get new" do
    get new_beneficiary_url
    assert_response :success
  end

  test "should create beneficiary" do
    assert_difference("Beneficiary.count") do
      post beneficiaries_url, params: { beneficiary: { date_of_birth: @beneficiary.date_of_birth, insured_id: @beneficiary.insured_id, name: @beneficiary.name, relationship: @beneficiary.relationship } }
    end

    assert_redirected_to beneficiary_url(Beneficiary.last)
  end

  test "should show beneficiary" do
    get beneficiary_url(@beneficiary)
    assert_response :success
  end

  test "should get edit" do
    get edit_beneficiary_url(@beneficiary)
    assert_response :success
  end

  test "should update beneficiary" do
    patch beneficiary_url(@beneficiary), params: { beneficiary: { date_of_birth: @beneficiary.date_of_birth, insured_id: @beneficiary.insured_id, name: @beneficiary.name, relationship: @beneficiary.relationship } }
    assert_redirected_to beneficiary_url(@beneficiary)
  end

  test "should destroy beneficiary" do
    assert_difference("Beneficiary.count", -1) do
      delete beneficiary_url(@beneficiary)
    end

    assert_redirected_to beneficiaries_url
  end
end
