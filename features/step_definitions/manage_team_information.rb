Given /^I have membership and administrator roles$/ do
  @administrator_role = Factory(:role, :name => "Administrator", :id => 1)
  @membership_role = Factory(:role, :name => "Member", :id => 2)
end

When /^I belong to a team$/ do
  @membership1 = Factory(:membership, :user_id => @user.id, :role_id => 2)
  @team1 = @membership1.team_id
end

When /^I am a team administrator$/ do
  @team1 = Factory(:team)
  @membership2 = Factory(:membership, :user_id => @user.id, :team_id => @team1.id)
end

When /^I click on a team name$/ do
  team = Team.find(@membership1.team_id)
  visit team_path(team)
end

When /^I modify team information$/ do
  @team1.name = "Updated Team Name"
end

Then /^I should see my team$/ do
  team = Team.find(@membership1.team_id)
  page.should have_content("#{team.name}")
end

Then /^I should see my team role$/ do
  role = Role.find(@membership1.role_id)
  page.should have_content("#{role.name}")
end

Then /^I should see a link to my team$/ do
  team = Team.find(@membership2.team_id)  
  page.should have_content("teams/#{team.id}") 
end

