class PostsController < ApplicationController
  before_action :set_post, except: i%[ index new create ]
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post, notice: 'Post successfully created!'
    else
      render :new
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to post_url, notice: 'Post successfully destroyed'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content_raw)
  end
end
