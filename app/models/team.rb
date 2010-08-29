class Team < ActiveRecord::Base
  validates_presence_of :name, :shortname
  validates_uniqueness_of :name, :shortname, :case_sensitive => false
  validates_format_of :shortname, :with =>/^\w*$/
  #after_create :create_admin(user)
  
  
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :games
  
  def get_admin_user
    team_admin = Membership.find_admin_user(id)
    team_admin_user = team_admin.user_id    
  end

  def create_admin(user)
    memberships.create(:user_id => user, :role_id=>1)
  end
  
end
