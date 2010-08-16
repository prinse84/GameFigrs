Given /^I am logged in$/ do
  @user = Factory(:user)  
  steps %Q{
    When I go to the login page
    And I fill in "user_username" with "#{@user.username}"
    And I fill in "user_password" with "#{@user.password}"
    And I press "user_submit"
    Then I should see "Signed in successfully."
    }
end

When /^I click 'Create team'$/ do
  visit new_team_path
end

Given /^I am not logged in$/ do
  visit destroy_user_session_path
end

When /^I fill in team information$/ do
  @team = Factory.build(:team) 
  steps %Q{
      When I go to the create team page
      And I fill in "team_name" with "#{@team.name}"
      And I fill in "team_shortname" with "#{@team.shortname}"
      Then the "team_name" field should contain "#{@team.name}"
      And the "team_shortname" field should contain "#{@team.shortname}"
    }
end
