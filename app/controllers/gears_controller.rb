class GearsController < ApplicationController
  before_action :require_user_logged_in, only: %i[new create destroy edit update]
  before_action :correct_user, only: %i[destroy edit update]
  before_action :set_gear, only: %i[show destroy edit update]

  def new
    @gear = Gear.new
  end

  def create
    @gear = current_user.gears.build(gear_params)
    if @gear.save
      flash[:success] = 'ギアを投稿しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ギアの投稿に失敗しました。'
      render :new
    end
  end

  def destroy
    @gear.destroy
    flash[:success] = 'ギアを削除しました。'
    redirect_to root_url
  end

  def show; end

  def edit; end

  def update
    if @gear.update(gear_params)
      flash[:success] = 'ギアは正常に更新されました'
      redirect_to @gear
    else
      flash.now[:danger] = 'ギアは更新されませんでした'
      render :edit
    end
  end

  private

  def gear_params
    params.require(:gear).permit(:title, :amazonUrl, :image, :content, :image_cache)
  end

  def correct_user
    @gear = current_user.gears.find_by(id: params[:id])
    redirect_to root_url unless @gear
  end

  def set_gear
    @gear = Gear.find(params[:id])
  end
end
