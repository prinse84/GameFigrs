Given /^I have a game$/ do
    @game1 = Factory(:game)
end

When /^I click on a game$/ do
  visit game_path(@game1)
end
