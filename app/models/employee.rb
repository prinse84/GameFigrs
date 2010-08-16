class Employee
  include ActiveModel::Validations
  include ActiveModel::Dirty
  attr_accessor :name, :email, :message
  validates_presence_of :name, :email
end