class AddPerSectionToQuiz < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :per_section, :integer
  end
end
