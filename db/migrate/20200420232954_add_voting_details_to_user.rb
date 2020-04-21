class AddVotingDetailsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :has_voted, :boolean, default: false
    add_column :users, :name_votes, :integer, default: 0
    add_column :users, :uniform_votes, :integer, default: 0
    add_column :users, :points, :integer, default: 0
    add_column :users, :team_name, :string
  end
end
