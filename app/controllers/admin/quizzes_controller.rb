
class Admin::QuizzesController < ApplicationController
  before_action :check_admin

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def update_section_numbers
    Quiz.update_all(sections: params[:section_number], per_section: params[:per_section], section_enabled: params[:section_enabled])
    
  end
end
