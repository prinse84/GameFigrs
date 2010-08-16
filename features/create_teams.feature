Feature:Create Teams
	In order to manage teams
	As a logged in user
	I want to create a team
	
	Scenario:Show Create Team Link
		Given I am logged in
		When I click 'Create team'
		Then I should see "Create a New Team"
		
	Scenario:Show Create Team Link NOT logged in
		Given I am not logged in
		When I click 'Create team'
		Then I should not see "Create a New Team"	
		And I should see "You need to sign in or sign up before continuing"
		
	Scenario:Show Create team form
		Given I am logged in
		When I go to the create team page
		Then I should see "Enter Team Name"
		And I should see "Enter Team Shortname"
	
	Scenario:Create team
		Given I am logged in
		When I fill in team information
		And I press "Continue"
		Then I should see "Team was successfully created"
		And I should see "You are the team administrator"