Feature:Manage Team Information
	In order to maintain team information
	As an administrator
	I want to manage team information
   
	Background:Create default roles
		Given I have membership and administrator roles
		
	Scenario: Show My Teams
		Given I am logged in
		When I belong to a team
		And I go to the users home page
		Then I should see my team
		And I should see my team role	
		
	Scenario:Show My Team Link
		Given I am logged in
		When I am a team administrator
		And I go to the users home page	
		Then I should see a link to my team
					
	Scenario:Show Team Home Page
		Given I am logged in
		When I belong to a team
		And I go to the users home page
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
		When I go to the edit team page	
		And I modify team information
		And I press "Save"
		Then I should see "Team information was successfully updated"
		And I should be on the team home page				
		
	Scenario:Show Delete team button
		Given I am logged in
		And I am a team administrator
		When I go to the edit team page
		Then I should see "Delete"
		
	Scenario: Delete Team
		Given I am logged in 
		And I am a team administrator
		When I go to the edit team page
		And I follow "Delete Team"
		Then I should see "Team has been successfully deleted"
		And I should be on the users home page
		