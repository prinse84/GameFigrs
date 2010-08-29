class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.date :game_date
      t.string :opponent_name

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
