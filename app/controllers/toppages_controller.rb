class ToppagesController < ApplicationController
  def index
    @gears = Gear.order('created_at DESC').page(params[:page])
  end

  def counts(user)
    @count_microposts = user.microposts.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
  end
end
