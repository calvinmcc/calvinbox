class QuizzesController < ApplicationController
  def new
  end

  def show
    @quiz = Quiz.find(params[:id])
    if @quiz != current_user.quiz
      redirect_to root_path, notice: "Wrong quiz you ding dong!" and return
    end
    number_of_questions = @quiz.per_section * @quiz.section_enabled
    @questions = @quiz.questions.first(number_of_questions)
    @users = User.where.not(role: "admin")
  end

  def edit

  end

  def create

  end

  def update
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions.page(params[:page]).per(5)
    if @quiz.update(quiz_params)
      redirect_to quiz_path(id: @quiz.id, params: { page: params[:page]})
    else
      render :action => 'edit'
    end
  end

  def destroy

  end

  def quiz_params 
    params.require(:quiz).permit(:quiz, :questions, :question, questions_attributes: [:answer, :id, :name])
  end
end
