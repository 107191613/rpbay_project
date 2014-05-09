class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, :default => ""
      t.string :store_id,:default=>""
      t.string :description,  :default => ""

      t.timestamps
    end
  end
end
