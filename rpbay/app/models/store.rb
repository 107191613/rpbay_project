
class Store < ActiveRecord::Base
  attr_accessible :name, :bdarea_id, :description
  belongs_to :bdarea
  has_many :products

end