class GearsController < ApplicationController
  before_action :require_user_logged_in, only: %i[new create destroy edit update]
  before_action :correct_user, only: %i[destroy edit update]
  before_action :set_gear, only: %i[show destroy edit update]

  def new
    @gear = Gear.new
  end

  def create
    @gear = current_user.gears.build(gear_params)
    logger.debug @gear.errors.inspect
    if @gear.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @gears = current_user.gears.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @gear.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_to root_url
  end

  def show; end

  def edit; end

  def update
    if @gear.update(gear_params)
      flash[:success] = 'Message は正常に更新されました'
      redirect_to @gear
    else
      flash.now[:danger] = 'Message は更新されませんでした'
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
