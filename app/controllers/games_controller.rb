class GamesController < ApplicationController
  def index
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @team = Team.find(params[:team_id])
    @game =  @team.games.build
  end

  def edit
    @game = Game.find(params[:id])
  end

  def create
   @game = Game.new(params[:game])
   @team = Team.find(@game.team_id)
   if @game.save
     flash[:notice] = "Game Saved"      
     redirect_to(@team)
   else
     render :action => 'new', :id => @game.team_id
   end
  end
  
  def update
    @game = Game.find(params[:id])
     if @game.update_attributes(params[:game])
       flash[:notice] = "Game Updated."
       redirect_to(@game)      
     else
       render :action => 'edit'
     end
  end
  
  def destroy
    @game = Game.find(params[:id])
    @team = @game.team_id
    if @game.destroy
      flash[:notice] = "Game has been successfully deleted."
      redirect_to(team_url(@team))
    end
  end
  
end
