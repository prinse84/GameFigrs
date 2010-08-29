Feature:Manage Schedule
	In order to maintain a schedule
	As an administrator
	I want to manage games
	
	Scenario:Show Add Game Link
		Given I am logged in
		And I am a team administrator
		When I go to the team home page
		Then I should see "Add Game"
			
	Scenario:Show Add Game Page
		Given I am logged in
		And I am a team administrator
		And I am on the team home page
		When I follow "Add Game"
		Then I should be on the add game page

	Scenario:Add Game 
		Given I am logged in
		And I am a team administrator
		And I am on the team home page
		When I follow "Add Game"
		And I fill in "Opponent" with "test1"
		And I fill in "Date" with "2010-08-12"
		And I press "Save"
		Then I should see "Game Saved"
		And I should be on the team home page
		
	Scenario:Show Game Details
		Given I am logged in
		And I am a team administrator
		And I am on the team home page
		And I have a game
		When I click on a game
		Then I should be on the game details page
		And I should see "Game Details"
		
	Scenario:Show Edit Game Link
		Given I am logged in
		And I am a team administrator
		And I have a game
		When I go to the game details page
		Then I should see "Edit"
			
	Scenario:Show Edit Game Page
		Given I am logged in
		And I am a team administrator
		And I have a game
		When I go to the game details page
		And I follow "Edit"
		Then I should see "Update"	
	
	Scenario: Edit Game
		Given I am logged in
		And I am a team administrator
		And I have a game
		When I go to the game details page
		And I follow "Edit"
		And I fill in "Date" with "2010-08-11"		
		And I press "Update"
		Then I should see "Game Updated"
		And I should be on the game details page
		
	Scenario:Show Delete Game Link
		Given I am logged in 
		And I am a team administrator
		And I have a game
		When I go to the game details page
		Then I should see "Delete"
		
	Scenario:Delete Game
		Given I am logged in 
		And I am a team administrator
		And I have a game
		When I go to the game details page
		And I follow "Delete"
		Then I should see "Game has been successfully deleted"
		And I should be on the team home page