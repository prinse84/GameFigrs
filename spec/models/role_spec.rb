require 'spec_helper'

describe Role do
  
  it "should have a name" do
    role = Factory.build(:role)
    role.name = ''
    role.should_not be_valid
  end

  it "should have name that is unique" do
    role = Factory(:role)
    role2 = Factory.build(:role, :name => role.name.downcase)
    role2.should_not be_valid
  end
  
  it "should have name that is UNIQUE" do
    role = Factory(:role)
    role2 = Factory.build(:role, :name => role.name.upcase)
    role2.should_not be_valid
  end
  
end
