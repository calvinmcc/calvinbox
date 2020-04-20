class AddQuestionsToQuiz
  def initialize(user)
    @user = user
    @quiz = Quiz.find_or_create_by(user_id: @user.id)
  end

  def generate_questions(destroy: false)
    if @quiz.questions.present? && destroy
      @quiz.questions.destroy_all
    elsif @quiz.questions.present?
      return true
    end

    questions_arr.each_with_index do |question, i|
      if question.split('-')&.first == 'IMAGE'
        file = question.split('-')&.last
        qq = @quiz.questions.create({number: i + 1})
        qq.song_file.attach(io: File.open("app/assets/songs/#{file}"), filename: "#{file}", content_type: 'audio/m4a')
        qq.save
      else
        @quiz.questions.create({
          name: question,
          number: i + 1
        })
      end
    end


  end


  def questions_arr
    [
      "How is the groundnut better known?",
      'What word can go before "decision", "personality" and second"?',
      '"Jana Gana Mana" is the national anthem of which South Asian country?',
      "What city in North Dakota shares the same name as popular dark comedy film turned TV show?",
      "Which country was the Caesar salad invented in?",
      'The "tub", "oyster", and "water wheel", are beginner moves in what Olympic sport?',
      "The Pyrenees mountain range separates which two European countries? (2 points)",
      "What title is shared by a 1983 Lionel Richie song and a 2015 Adele song?",
      "Weighing at ~400lbs, which mammal has the largest heart?",
      "Apples, pears, plums, peaches and strawberries all belong to which family of flowering plants?",
      "Rank the following areas in order from SMALLEST to LARGEST: Disneyworld, Toronto Zoo, Tofino, Tokyo, Grand Canyon National Park, Maui, Vatican City, Palace of Versailles, Shuswap Lake, Leichtenstein",
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      'IMAGE-clip_8.m4a'
    ]
  end
end
