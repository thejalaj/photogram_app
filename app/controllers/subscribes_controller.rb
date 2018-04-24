class SubscribesController < ApplicationController
  before_action :logged_in_user

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    @user=user
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    user = Subscribe.find(params[:id]).followed
    current_user.unfollow(user)
    @user=user
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end