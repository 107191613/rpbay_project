class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name, :default => ""
      t.string :bdarea_id,:default=>""
      t.string :points ,:default=>""
      t.string :description,  :default => ""

      t.timestamps
    end
  end
end
