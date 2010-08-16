class Membership < ActiveRecord::Base
  validates_presence_of :role_id, :team_id, :user_id
  validates_uniqueness_of :user_id, :scope => 'team_id', :message => 'User is already a member of this team'
  validates_uniqueness_of :role_id, :scope => 'team_id', :if => Proc.new {|role| role.role_id == 1 }, :message => 'Team can only have administrator'
  
  belongs_to :team
  belongs_to :user
  belongs_to :role
  
  def self.find_admin_user(team)
    find(:first, :conditions => {:team_id => team, :role_id => 1})
  end
  
  def self.find_team_role(user, team)
    find(:first, :conditions => {:team_id => team, :user_id => user})
  end  
end
