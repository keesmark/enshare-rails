class ToppagesController < ApplicationController
  def index
    @gears = Gear.order('created_at DESC').page(params[:page]).per(9)
  end
end
