class PostsController < ApplicationController

  before_action :new_or_load_post, only: [ :new, :edit, :create, :update, :destroy, :show ]

  def index
    @posts = Post.all
  end

  def new
  end

  def edit
  end

  def create
    save_post(:new)
  end

  def update
    save_post(:edit)
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
    end
  end

  protected

  def save_post(action)
    if @post.update_attributes(post_params)
      respond_to do |format|
        format.html { redirect_to posts_url }
      end
    else
      respond_to do |format|
        format.html { render action }
      end
    end
  end

  def new_or_load_post
    @post = params[:id].blank? ? Post.new : Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :contents)
  end

end