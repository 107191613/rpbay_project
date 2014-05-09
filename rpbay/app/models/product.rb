
class Product < ActiveRecord::Base
  attr_accessible :name, :store_id, :description
  belongs_to :store


end