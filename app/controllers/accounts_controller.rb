class AccountsController < ApplicationController
  def index
  end

  def show
    @user = User.find(current_user.id)
    @teams = @user.teams
  end

end
