class AddDetailsToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :name, :string
    add_column :questions, :number, :integer
    add_column :questions, :answer, :text
  end
end
