class DashboardController < ApplicationController
  def index
    @users = User.includes(:roles).page params[:page]
  end
end
