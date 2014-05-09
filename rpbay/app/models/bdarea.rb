
class Bdarea < ActiveRecord::Base
  attr_accessible :address,:bdpoint, :description
  validates :address, :uniqueness=>true
  has_many :stores
end
