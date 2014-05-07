class Categories < ActiveRecord::Migration
  def change
    create_table  :Categories do |t|
      t.string :name,:size=>75, null:false
      t.integer :parentid, null:true
      t.string :status,:size=>1, null:true
      t.timestamps
    end
  end
end
