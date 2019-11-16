class UsersController < ApplicationController
  before_action :require_user_logged_in, only: %i[index show followings followers]
  before_action :set_user, only: %i[show destroy edit update]

  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @gears = @user.gears.order('created_at DESC').page(params[:page])
    counts(@user)
    @user_items = @user.items
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user
      @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit; end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:success] = 'ユーザーは削除されました。'
    redirect_to classifieds_url
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を変更しました。'
      redirect_to @user
    else
      flash.now[:danger] = '更新に失敗しました。'
      render :edit
    end
  end

  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end

  def favorites
    @user = User.find(params[:id])
    @gears = current_user.favorite_gears.order('created_at DESC').page(params[:page])
    counts(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
