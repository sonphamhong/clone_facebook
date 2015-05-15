class GroupsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @group = Group.find(params[:message][:group_id])
    @message = Message.new(params[:message])
    @message.user = current_user
    @message.save
    redirect_to @group
  end

  def show
    @group = Group.find(params[:id])
    @messages = @group.messages
    @message = Message.new
  end

  def create_message
    
  end
end
