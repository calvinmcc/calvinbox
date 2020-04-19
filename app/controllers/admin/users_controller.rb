class Admin::UsersController < ApplicationController

  before_action :check_admin

  def index
    @user = User.new
    @users = User.all

  end

end
