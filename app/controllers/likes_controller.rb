class LikesController < ApplicationController

  def create
    like_relationship = Like.new(like_params)
    if like_relationship.save
      flash[:success] = "review changed created!"
      redirect_to root_url
    else
      flash[:success] = "error!"
    end
  end

  def destroy
    like_relationship = Like.where(like_params).last
    if like_relationship.destroy
      flash[:success] = "review changed created!"
      redirect_to root_url
    else
      flash[:success] = "error!"
    end
  end

  def like_params
    params.permit(:user_id, :post_id)
  end
end
