class AddQuestionsToQuiz
  def initialize(user)
    @user = user
    @quiz = user.quiz
  end

  def generate_questions(destroy: false)
    if @quiz.questions.present? && destroy
      @quiz.questions.destroy_all
    end

    20.times do |i| 
      @quiz.questions.create({
        name: questions_arr[i],
        number: i
      })
    end


  end


  def questions_arr
    [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20
    ]
  end
end
