require "application_system_test_case"

class InsuredsTest < ApplicationSystemTestCase
  setup do
    @insured = insureds(:one)
  end

  test "visiting the index" do
    visit insureds_url
    assert_selector "h1", text: "Insureds"
  end

  test "should create insured" do
    visit insureds_url
    click_on "New insured"

    fill_in "Tin no", with: @insured.TIN_no
    fill_in "Address", with: @insured.address
    fill_in "Age", with: @insured.age
    fill_in "Birthdate", with: @insured.birthdate
    fill_in "Civil status", with: @insured.civil_status
    fill_in "Cooperative branch", with: @insured.cooperative_branch_id
    fill_in "Cooperative", with: @insured.cooperative_id
    fill_in "First name", with: @insured.first_name
    fill_in "Gender", with: @insured.gender
    fill_in "Id no", with: @insured.id_no
    fill_in "Id type", with: @insured.id_type
    fill_in "Last name", with: @insured.last_name
    fill_in "Middle name", with: @insured.middle_name
    fill_in "Nationality", with: @insured.nationality
    fill_in "Place of birth", with: @insured.place_of_birth
    fill_in "Premium", with: @insured.premium
    fill_in "Suffix", with: @insured.suffix
    click_on "Create Insured"

    assert_text "Insured was successfully created"
    click_on "Back"
  end

  test "should update Insured" do
    visit insured_url(@insured)
    click_on "Edit this insured", match: :first

    fill_in "Tin no", with: @insured.TIN_no
    fill_in "Address", with: @insured.address
    fill_in "Age", with: @insured.age
    fill_in "Birthdate", with: @insured.birthdate
    fill_in "Civil status", with: @insured.civil_status
    fill_in "Cooperative branch", with: @insured.cooperative_branch_id
    fill_in "Cooperative", with: @insured.cooperative_id
    fill_in "First name", with: @insured.first_name
    fill_in "Gender", with: @insured.gender
    fill_in "Id no", with: @insured.id_no
    fill_in "Id type", with: @insured.id_type
    fill_in "Last name", with: @insured.last_name
    fill_in "Middle name", with: @insured.middle_name
    fill_in "Nationality", with: @insured.nationality
    fill_in "Place of birth", with: @insured.place_of_birth
    fill_in "Premium", with: @insured.premium
    fill_in "Suffix", with: @insured.suffix
    click_on "Update Insured"

    assert_text "Insured was successfully updated"
    click_on "Back"
  end

  test "should destroy Insured" do
    visit insured_url(@insured)
    click_on "Destroy this insured", match: :first

    assert_text "Insured was successfully destroyed"
  end
end
