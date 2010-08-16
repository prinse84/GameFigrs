class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable,  and :oauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  
  has_many :memberships
  has_many :teams, :through => :memberships
  
  def team_admin?(team)
     team_role = Membership.find_team_role(id, team)
     if (team_role.role_id == 1)
       true
     else
       false
     end
     
     #team_role.role_id == 1 ? true : false
   end
   
end
