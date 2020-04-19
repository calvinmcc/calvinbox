class AdminController < ApplicationController

  before_action :check_admin

  def index

    @users = User.all

  end

  private

  def check_admin
    byebug
    if current_user.role != "admin"
      redirect_to root_path, notice: "Nope! No cheating!" and return
    end
  end
end
