class CreateBdareas < ActiveRecord::Migration
  def change
    create_table :bdareas do |t|
      t.string :address, :default => ""        #百度区域名字
      t.string  :bdpoint,:default => ""    #百度区域点
      t.string :description,  :default => ""#区域描述

      t.timestamps
    end
  end
end
