Feature:Manage Roster
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
		When I click "Add Game"
		Then I should see "Opponent"
		And I should be on the add game page
		
	Scenario:Add Game 
		Given I am logged in
		And I am a team administrator
		And I am on the add game page
		When I click "Save"
		Then I should see "Game Saved"
		And I should be on the team home page
		
	Scenario:Show Edit Game Page
		Given I am logged in
		And I am a team administrator
		And I am on the add game page
		When I click on a game
		Then I should be on the edit game page
		And I should see "Opponent"
		
	Scenario:Edit Game
		Given I am logged in
		And I am a team administrator
		And I am on the edit game page
		When I click "Save"
		Then I should see "Game saved successfully"
		And I should be on the team home page
		
	Scenario:Delete Game - Unconfirmed
		Given I am logged in
		And I am a team administrator
		And I am on the edit game page
		When I click "Delete"
		Then I should see "Are you sure you want to delete this game?"
		
	Scenario:Delete Game - Confirmed
		Given I am logged in 
		And I am a team administrator
		And I am on the edit game page
		When I click the game delete confirmation
		Then I should see "Game has been successfully deleted"
		And I should be on the team home page