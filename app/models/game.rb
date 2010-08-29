class Game < ActiveRecord::Base
  validates_presence_of :game_date, :opponent_name, :team_id
  validates_uniqueness_of :opponent_name, :scope => "game_date", :message => 'Already playing this opponent on this date'
  
  belongs_to :team
  
end
