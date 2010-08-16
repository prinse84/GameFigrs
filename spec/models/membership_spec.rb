require 'spec_helper'

describe Membership do
  it "should have a role" do
     membership = Factory.build(:membership)
     membership.role_id = ''
     membership.should_not be_valid
  end
   
  it "should have a user" do
    membership = Factory.build(:membership)
    membership.user_id = ''
    membership.should_not be_valid
  end
  
  it "should have a team" do
     membership = Factory.build(:membership)
     membership.team_id = ''
     membership.should_not be_valid
  end
  
  it "should have unique team and user combinations" do
    membership = Factory(:membership)
    membership2 = Factory.build(:membership, :user_id => membership.user_id, :team_id => membership.team_id)
    membership2.should_not be_valid
  end

  it "should have unique team and user combinations" do
    membership = Factory(:membership)
    team1 = Factory(:team)
    membership2 = Factory.build(:membership, :user_id => membership.user_id, :team_id => team1.id)
    membership2.should be_valid
  end  
  
end
