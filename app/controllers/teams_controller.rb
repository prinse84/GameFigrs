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
    @team = Team.find(params[:id])
  end
  
  def create
    @team = Team.new(params[:team])
    if @team.save
      @team.create_admin(current_user)
      flash[:notice] = "Team was successfully created."      
      redirect_to(@team)
    else
      render :action => 'new'
    end
  end
  
  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(params[:team])
      flash[:notice] = "Team information was successfully updated."
      redirect_to(@team)      
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @team = Team.find(params[:id])
    @account = current_user.id
    if @team.destroy
      flash[:notice] = "Team has been successfully deleted."
      redirect_to(account_url(@account))
    end
  end

end
