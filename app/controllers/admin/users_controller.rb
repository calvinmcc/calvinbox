class Admin::UsersController < ApplicationController

  before_action :check_admin

  def index
    @user = User.new
    @users = User.all.where(role: 'team')
  end


  def update_quizzes
    if params[:reset] == '1' && current_user&.role == 'admin' && User.find_by(username: params[:username]).present?
      AddQuestionsToQuiz.new(User.find_by(username: params[:username])).generate_questions(destroy: true)
      redirect_to admin_path and return
    end
    @user = User.new(user_params)
      if @user.save
        AddQuestionsToQuiz.new(@user).generate_questions(destroy: false)
      else
        format.html { render :index }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
  end

end
