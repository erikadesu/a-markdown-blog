class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(5)
  end
end
