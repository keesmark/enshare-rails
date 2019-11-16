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
    @count_favorites = user.favorites.count
    @count_want = user.want_items.count
  end

  def read(result)
    code = result['itemCode']
    name = result['itemName']
    url = result['itemUrl']
    img_url = result['mediumImageUrls'][0]
    price = result['itemPrice']
    {
      code: code,
      name: name,
      url: url,
      img_url: img_url,
      price: price
    }
  end
end
