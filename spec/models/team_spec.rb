require 'spec_helper'

describe Team do
  
  it "should have a name" do
    team = Factory.build(:team)
    team.name = ''
    team.should_not be_valid
  end
  
  it "should have a shortname" do
    team = Factory.build(:team)
    team.shortname = ''
    team.should_not be_valid
  end
  
  it "should have a name that is unique" do
    team = Factory(:team)
    team2 = Factory.build(:team, :name => team.name.downcase)
    team2.should_not be_valid
  end
  
  it "should have a name that is UNIQUE" do
    team = Factory(:team)
    team2 = Factory.build(:team, :name => team.name.upcase)
    team2.should_not be_valid
  end
  
  it "should have a shortname that is unique" do
    team = Factory(:team)
    team2 = Factory.build(:team, :shortname => team.shortname.downcase)
    team2.should_not be_valid
  end
  
  it "should have a shortname that is UNIQUE" do
     team = Factory(:team)
     team2 = Factory.build(:team, :shortname => team.shortname.upcase)
     team2.should_not be_valid
   end
     
  it "should have a shortname that does not contain any special characters" do
    team = Factory.build(:team, :shortname => "My Team")
    team.should_not be_valid
  end
  
  it "should have a shortname that does not contain any special characters" do
    team = Factory.build(:team, :shortname => "MyTeam")
    team.should be_valid
  end
    
  it "should have only one adminstrator" do
    membership = Factory(:membership, :role_id => 1)
    user = Factory(:user)
    membership2 = Factory.build(:membership, :user_id =>user.id, :team_id => membership.team_id)
    membership2.should_not be_valid
  end
  
  it "should have a membership after creation" do
    user = Factory(:user)
    team = Factory(:team)
    team.create_admin(user)
    team.memberships.size.should eql(1)
  end
  
  it "should have only one adminstrator" do
     membership = Factory(:membership)
     user = Factory(:user)
     membership2 = Factory.build(:membership, :user_id =>user.id, :team_id => membership.team_id, :role_id => 2)
     membership2.should be_valid
   end
  
  it "returns the correct administrator" do
     admin_user = Factory(:user)
     membership = Factory(:membership, :user_id => admin_user.id)
     user = Factory(:user)
     membership2 = Factory(:membership, :user_id => user.id, :team_id => membership.team_id, :role_id => 2)   
     team = Team.find(membership.team_id)
     result = team.get_admin_user
     result.should eql(admin_user.id)
  end
  
  it "returns the correct administrator" do
     admin_user = Factory(:user)
     membership = Factory(:membership, :user_id => admin_user.id, :role_id => 1)
     user = Factory(:user)
     membership2 = Factory(:membership, :user_id => user.id, :team_id => membership.team_id, :role_id => 2)   
     team = Team.find(membership.team_id)
     result = team.get_admin_user
     result.should_not eql(user.id)
  end
  
  it "returns the correct role for a user" do
    user = Factory(:user)
    membership = Factory(:membership, :user_id => user.id, :role_id => 1)    
    result = user.team_admin?(membership.team_id)
    result.should eql(true)
  end
  
  it "returns the correct role for a user" do
     user = Factory(:user)
     membership = Factory(:membership, :user_id => user.id, :role_id => 2)    
     result = user.team_admin?(membership.team_id)
     result.should_not eql(true)
   end
  
  
end
