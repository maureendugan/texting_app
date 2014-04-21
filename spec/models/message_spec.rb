require 'spec_helper'

describe Message, vcr: true do
  it 'saves a message if sent' do
    message = Message.new({ to: '6072620716', from: '5038289722', body: 'Hello this is a message'})
    message.save.should be_true
  end

end
