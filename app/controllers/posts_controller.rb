class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def show
    @post=Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "post created!"
      redirect_to root_url
    else
      render root_url
    end
  end

  def destroy
    @post.destroy
    redirect_back_or root_path
  end

  private

    def post_params
      params.require(:post).permit(:content, :image)
    end
end
