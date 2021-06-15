class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @message = Message.new
    @group = Group.find(params[:group_id])
    @users = @group.users
    @messages = @group.messages.includes(:user)
  end

  def create
    @group = Group.find(params[:group_id])
    @message = @group.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group)
    else
      @users = @group.users
      @messages = @group.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
