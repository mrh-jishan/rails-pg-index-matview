class User < ApplicationRecord
  has_and_belongs_to_many :roles

  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email
end
