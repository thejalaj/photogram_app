class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @post  = current_user.posts.build
      @posts=Post.where(user_id: current_user.following.pluck(:id) + [current_user.id]).order(updated_at: :desc).sort_by {|obj| obj.updated_at}.reverse
    end
  end

  def help
  end

  def about
  end

  def contact
  end

end
