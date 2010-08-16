class TeamsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
  end
  
  def show
   @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def edit
  end
  
  def create
    @team = Team.new(params[:team])
    if @team.save
   #   @team.memberships.create(:user_id => current_user.id, :role_id => 1)
      flash[:notice] = "Team was successfully created."      
      redirect_to(@team)
    else
      render :action => 'new'
    end
  end

end
