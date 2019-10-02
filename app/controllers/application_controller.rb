class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  def require_user_logged_in
    redirect_to signin_url unless logged_in?
  end

  def counts(user)
    @count_gears = user.gears.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
  end
end
