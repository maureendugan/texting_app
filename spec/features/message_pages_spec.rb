require 'spec_helper'

describe "Messages", vcr: true do

  it 'should allow a user to send messages' do
    message = FactoryGirl.build(:message)
    visit new_message_path
    fill_in :message_to, with: message.to
    fill_in :message_from, with: message.from
    fill_in :message_body, with: message.body
    click_button "Create Message"
    page.should have_content "Your message has been sent"
  end

  it 'should display errors' do
    message = FactoryGirl.build(:message)
    visit new_message_path
    fill_in :message_to, with: message.to
    fill_in :message_from, with: ""
    fill_in :message_body, with: message.body
    click_button "Create Message"
    page.should have_content "Please fix the following"
  end

  it 'displays a message' do
    message = FactoryGirl.create(:message)
    visit message_path message
    page.should have_content "#{message.body}"
  end

end
