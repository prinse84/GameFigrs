class AddTeamtoGame < ActiveRecord::Migration
  def self.up
    add_column :games, :team_id, :integer
  end

  def self.down
    remove_column :games, :team_id
  end
end
