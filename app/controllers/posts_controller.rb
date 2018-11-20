class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = policy_scope(Post).order(created_at: :desc)
  end

  def show
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post
    if @post.save
      redirect_to @post, notice: 'Your post was created!🥳'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Your post was updated!😄'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Your post was annhilated 👻'
  end

  private

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

  def post_params
    params.require(:post).permit(:title, :content_raw)
  end
end
