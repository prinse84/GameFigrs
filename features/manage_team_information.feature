Feature:Manage Team Information
	In order to maintain team information
	As an administrator
	I want to manage team information
   
	Background:Create default roles
		Given I have membership and administrator roles
		
	@wip
	Scenario: Show My Teams
		Given I am logged in
		When I belong to a team
		And I go to the users home page
		Then I should see my team
		And I should see my team role	
	
	Scenario:Show My Team Link
		Given I am logged in
		When I am a team administrator
		And I go to the user home page		
		Then I should see a link to my team
		
	Scenario:Show Team Home Page
		Given I am logged in
		When I belong to a team
		And I go to the user home page
		And I click on a team name
		Then I should be on the team home page
		And I should see my team
		
	Scenario:Show Edit Team Link
		Given I am logged in
		When I am a team administrator
		And I go to the team home page
		Then I should see "Edit Team"		
		
	Scenario:Show Edit Team Form
		Given I am logged in
		And I am a team administrator
		When I go to the edit team page
		Then I should see "Team Name"
		And I should see "Team Shortname"
			
	Scenario:Edit team
		Given I am logged in
		And I am a team administrator		
		When I modify team information
		And I press "Save"
		Then I should see "Team information was successfully updated"
		And I should go to the team home page				
		
	Scenario:Show Delete team button
		Given I am logged in
		And I am a team administrator
		When I go to the team home page
		Then I should see "Delete Team" button
		
	Scenario:Delete Team Show Confirmation
		Given I am logged in
		And I am a team administrator
		When I go to the team home page
		And I hit the "Delete Team" button
		Then I should see "Are you sure you want to delete this team?"
		
	Scenario: Delete Team
		Given I am logged in 
		And I am a team administrator
		When I click the team delete confirmation
		Then I should see "Team has been successfully deleted"
		And I should be on the user home page
		