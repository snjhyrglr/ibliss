require "application_system_test_case"

class OccupationsTest < ApplicationSystemTestCase
  setup do
    @occupation = occupations(:one)
  end

  test "visiting the index" do
    visit occupations_url
    assert_selector "h1", text: "Occupations"
  end

  test "should create occupation" do
    visit occupations_url
    click_on "New occupation"

    fill_in "Business type", with: @occupation.business_type
    fill_in "Employer address", with: @occupation.employer_address
    fill_in "Employer name", with: @occupation.employer_name
    fill_in "Insured", with: @occupation.insured_id
    fill_in "Name", with: @occupation.name
    click_on "Create Occupation"

    assert_text "Occupation was successfully created"
    click_on "Back"
  end

  test "should update Occupation" do
    visit occupation_url(@occupation)
    click_on "Edit this occupation", match: :first

    fill_in "Business type", with: @occupation.business_type
    fill_in "Employer address", with: @occupation.employer_address
    fill_in "Employer name", with: @occupation.employer_name
    fill_in "Insured", with: @occupation.insured_id
    fill_in "Name", with: @occupation.name
    click_on "Update Occupation"

    assert_text "Occupation was successfully updated"
    click_on "Back"
  end

  test "should destroy Occupation" do
    visit occupation_url(@occupation)
    click_on "Destroy this occupation", match: :first

    assert_text "Occupation was successfully destroyed"
  end
end
