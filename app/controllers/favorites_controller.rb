class FavoritesController < ApplicationController
  # before_action :require_user_logged_in
  def create
    @gear = Gear.find(params[:gear_id])
    @favorite = current_user.favorites.build(gear: @gear)
    if @favorite.save
      flash[:success] = 'ホシイ！しました。'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:danger] = 'ホシイ！できませんでした。'
    end
  end

  def destroy
    @gear = Gear.find(params[:gear_id])
    current_user.unfavorite(@gear)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
