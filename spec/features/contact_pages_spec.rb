require 'spec_helper'

describe "Contacts" do

  it 'should allow a user to create a new contact' do
    visit new_contact_path
    fill_in :contact_name, with: "Josh"
    fill_in :contact_phone_number, with: "6072620176"
    click_button "Create Contact"
    page.should have_content "Contact created"
  end




end
