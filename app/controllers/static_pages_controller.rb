class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @post  = current_user.posts.build
      @posts=Post.where(user_id: current_user.following.pluck(:id) + [current_user.id]).order(updated_at: :desc)
      @like_hash={}
      @posts.each do |post|
        @like_hash[post.id] ={}
        @like_hash[post.id] = Like.where(:post_id => post.id).where(:user_id=>current_user)
      end
    end
  end

  def help
  end

  def about
  end

  def contact
  end

end
