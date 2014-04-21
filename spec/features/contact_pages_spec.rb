require 'spec_helper'

describe "Contacts" do

  it 'should allow a user to create a new contact' do
    visit new_contact_path
    fill_in :contact_name, with: "Josh"
    fill_in :contact_phone_number, with: "6072620176"
    click_button "Create Contact"
    page.should have_content "Contact created"
  end

  it 'should display errors for invalid entries' do
    visit new_contact_path
    fill_in :contact_name, with: ""
    fill_in :contact_phone_number, with: "6072620176"
    click_button "Create Contact"
    page.should have_content "Please fix the following"
  end

  it 'should display a contact and give the option to send them a text' do
    contact = Contact.create({name: "Mac", phone_number: "1235557777"})
    visit contact_path(contact)
    click_link "Send #{contact.name} a message"
    page.should have_content "Create new message"
  end


end
