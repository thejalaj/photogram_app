class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @post  = current_user.posts.build
      @posts=[]
      current_user.following.each do |followed|
        @posts=@posts+followed.posts
      end
      @posts = @posts.sort_by {|obj| obj.created_at}.reverse
    end
  end

  def help
  end

  def about
  end

  def contact
  end

end
