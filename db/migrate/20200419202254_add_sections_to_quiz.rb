class AddSectionsToQuiz < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :sections, :integer
  end
end
