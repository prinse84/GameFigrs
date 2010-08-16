require 'spec_helper'

describe User do
  
  it "should be a member of many teams" do
     membership = Factory(:membership, :role_id => 2)
     team = Factory(:team)
     membership2 = Factory.build(:membership, :user_id =>membership.user_id, :team_id => team.id, :role_id => 2)
     membership2.should be_valid  
   end
   
   it "should be an administrator on many teams" do
     membership = Factory(:membership)
     team = Factory(:team)
     membership2 = Factory.build(:membership, :user_id =>membership.user_id, :team_id => team.id)
     membership2.should be_valid
   end   
   
end
