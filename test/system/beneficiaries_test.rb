require "application_system_test_case"

class BeneficiariesTest < ApplicationSystemTestCase
  setup do
    @beneficiary = beneficiaries(:one)
  end

  test "visiting the index" do
    visit beneficiaries_url
    assert_selector "h1", text: "Beneficiaries"
  end

  test "should create beneficiary" do
    visit beneficiaries_url
    click_on "New beneficiary"

    fill_in "Date of birth", with: @beneficiary.date_of_birth
    fill_in "Insured", with: @beneficiary.insured_id
    fill_in "Name", with: @beneficiary.name
    fill_in "Relationship", with: @beneficiary.relationship
    click_on "Create Beneficiary"

    assert_text "Beneficiary was successfully created"
    click_on "Back"
  end

  test "should update Beneficiary" do
    visit beneficiary_url(@beneficiary)
    click_on "Edit this beneficiary", match: :first

    fill_in "Date of birth", with: @beneficiary.date_of_birth
    fill_in "Insured", with: @beneficiary.insured_id
    fill_in "Name", with: @beneficiary.name
    fill_in "Relationship", with: @beneficiary.relationship
    click_on "Update Beneficiary"

    assert_text "Beneficiary was successfully updated"
    click_on "Back"
  end

  test "should destroy Beneficiary" do
    visit beneficiary_url(@beneficiary)
    click_on "Destroy this beneficiary", match: :first

    assert_text "Beneficiary was successfully destroyed"
  end
end
