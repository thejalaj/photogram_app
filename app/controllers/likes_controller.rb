class LikesController < ApplicationController

  def create
    like_relationship = Like.new(like_params)
    @post=Post.where(:id => like_relationship.post_id).last
    if like_relationship.save
      flash[:success] = "review changed created!"
      respond_to do |format|
        format.js
      end
    else
      flash[:success] = "error!"
    end
  end

  def unlike
    like_relationship = Like.where(like_params).last
    @post=Post.where(:id => like_relationship.post_id).last
    if like_relationship.destroy
      flash[:success] = "review changed created!"
      respond_to do |format|
        format.js
      end
    else
      flash[:success] = "error!"
    end
  end

  def like_params
    params.permit(:user_id, :post_id)
  end
end
