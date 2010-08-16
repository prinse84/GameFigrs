Feature:Manage Roster
	In order to maintain a roster
	As an administrator
	I want to manage members

	Scenario:Show Manage Roster Link
		Given I am logged in
		And I am a team administrator
		When I go to the team home page
		Then I should see "Manage Roster"
		
	Scenario:Show roster page
		Given I am logged in
		And I am a team administrator
		And I am on the team home page
		When I click on "Manage Roster"
		Then I should be on the roster page
		
	Scenario:Show Add Member form
		Given I am logged in
		And I am a team administrator
		And I am on the roster page
		When I click on "Add Member"
		Then I should be on the add team member form
		And I should see "Email Address"
		And I should see "Username"
		And I should see "Add"
		
	Scenario:Add Member
		Given I am logged in
		And I am a team administrator
		And I am on the add team member page
		When I click "Add"
		Then I should see "Team member successfully added"
		And I should be on the roster page
		
	Scenario:Remove member from team
		Given I am logged in
		And I am a team administrator
		And I am on the roster page
		When I select a team member
		And I click "Remove"
		Then I should see "Team member successfully removed"
		And I should be on the roster page
		
	Scenario:Show Edit member info page
		Given I am logged in
		And I am a team administrator
		And I am on the roster page
		When I select a team member
		And I click "Edit"
		Then I should be on the edit team member page
		And I should see "Save"
		
	Scenario:Edit member info
		Given I am logged in
		And I am a team administrator
		And I am on the edit team member page
		When I click "Save"
		Then I should see "Team member successfully updated"
		And I should be on the roster page
	
		
	