require 'spec_helper'

describe Game do

  it "should have a team" do
    game = Factory.build(:game)
    game.team_id = ''
    game.should_not be_valid
  end
  
  it "should have a date" do
    game = Factory.build(:game)
    game.game_date = ''
    game.should_not be_valid
  end
  
  it "should have an opponent" do
    game = Factory.build(:game)
    game.opponent_name = ''
    game.should_not be_valid
  end
  
  it "should have a unique game date and opponent combination" do 
    game1 = Factory(:game)
    game2 = Factory.build(:game, :game_date => game1.game_date, :opponent_name => game1.opponent_name)
    game2.should_not be_valid
  end
  
end
