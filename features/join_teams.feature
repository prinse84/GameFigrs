Feature:Join Teams
	In order to record statistics
	As a user
	I want to join a team
	
	@show_account
	Scenario:Show Add Team link
		Given I am logged in
		And I am on the users home page
		# Then I should see "Add Team"
		Then show me the page
		
	Scenario:Show Add Team Page
		Given I am logged in 
		When I am on the add team page
		Then I should see "Search"
		
	Scenario:Show team search results
		Given I am logged in
		When I am on the add team page
		And I search for a team
		Then I should see search results
		
	Scenario:Select team to join
		Given I am logged in 
		And I am on the add team page
		When I select a team to join
		And I click "Join"
		Then I should see "The team administrator has been notified"
		And I should be on the team home page
		
	Scenario:Show confirm team member link
		Given I am logged in
		And I am a team administrator
		When I go to the team home page
		Then I should see "Users pending confirmation link"
		
	Scenario:Confirm team member - Show pending team members
		Given I am logged in 
		And I am a team administrator
		When I go to the team member confirmation page
		Then I should see "confirm"
		
	Scenario:Confirm team member
		Given I am logged in 
		And I am a team administrator
		When I got to the team member confirmation page
		And I click "confirm"
		Then I should see "Team Member has been confirmed"
		And I should be on the team home page