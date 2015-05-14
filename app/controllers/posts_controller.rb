class PostsController < ApplicationController

    before_filter :authenticate_user!, only: [:create, :new, :edit, :destroy]
    def index
        @posts = current_user.posts

        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @posts }
        end
    end

    def show
        @comment = Comment.new
        @post = Post.find(params[:id])
        @comments = @post.comments

        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @post }
        end
    end

    def new
        @post = Post.new

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @post }
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def create
        @post = Post.new(params[:post])
        @post.user = current_user

        respond_to do |format|
            if @post.save
                format.html { redirect_to root_path, notice: 'Post was successfully created.' }
                format.json { render json: @post, status: :created, location: @post }
            else
                format.html { render action: "new" }
                format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        @post = Post.find(params[:id])

        respond_to do |format|
            if @post.update_attributes(params[:post])
                format.html { redirect_to @post, notice: 'Post was successfully updated.' }
                format.json { head :no_content }
            else
                format.html { render action: "edit" }
                format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        respond_to do |format|
            format.html { redirect_to posts_url }
            format.json { head :no_content }
        end
    end
end
