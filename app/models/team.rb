class Team < ActiveRecord::Base
  validates_presence_of :name, :shortname
  validates_uniqueness_of :name, :shortname, :case_sensitive => false
  validates_format_of :shortname, :with =>/^\w*$/
  after_create :create_admin
  
  has_many :memberships
  has_many :users, :through => :memberships
  
  def get_admin_user
    team_admin = Membership.find_admin_user(id)
    team_admin_user = team_admin.user_id    
  end
  
  private
  
  def create_admin
    memberships.create(:role_id=>1)
  end
  
end
