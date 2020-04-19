class AddSectionEnabledToQuizzes < ActiveRecord::Migration[6.0]
  def change

    add_column :quizzes, :section_enabled, :integer, default: 1

  end
end
