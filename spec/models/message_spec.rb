require 'spec_helper'

describe Message, vcr: true do
  it 'saves a message if sent' do
    message = Message.new({ to: '6072620716', from: '5038289722', body: 'Hello this is a message'})
    message.save.should be_true
  end
  it 'does not save a message if it is invalid' do
    message = Message.new({ to:'', from: '5038289722', body: 'Hello this is a message'})
    message.save.should be_false
  end
  it 'displays errors for invalid messages' do
    message = Message.new({ to: '0716', from: '5038289722', body: 'Hello this is a message'})
    message.save
    message.errors.messages[:base].should eq ["The 'To' number 0716 is not a valid phone number."]
  end

end
