class UsersController < ApplicationController

  def index
    @conversations = Conversation.involving(current_user).order("created_at DESC")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])
    @activities = PublicActivity::Activity.where(owner_id: @user.id, owner_type: "User").order("created_at desc")
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def follow
  	@user = User.find(params[:user])
	  current_user.follow!(@user)
  end

  def unfollow
  	@user = User.find(params[:user])
	  current_user.unfollow!(@user)
  end

  def like
    if params[:likeable_type] == "Post"
        @likeable = Post.find(params[:likeable_id])
    else
        @likeable = Comment.find(params[:likeable_id])
    end
	  current_user.like!(@likeable)
  end

  def unlike
    if params[:likeable_type] == "Post"
        @likeable = Post.find(params[:likeable_id])
    else
        @likeable = Comment.find(params[:likeable_id])
    end
	  current_user.unlike!(@likeable)
  end
end
