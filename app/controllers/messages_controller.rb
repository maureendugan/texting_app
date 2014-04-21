class MessagesController < ApplicationController

  def index
    @message = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Your message has been sent"
      redirect_to index
    else
      render new
    end
  end

  private
  def message_params
    params.require(:message).permit(:to, :from, :body)
  end

end
