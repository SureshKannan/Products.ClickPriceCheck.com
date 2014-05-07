class CategoryTypes < ActiveRecord::Migration
  def change
    create_table  :CategoryTypes do |t|
      t.string :name, :size=>75, null:false
      t.string :status, :size=>1, null:true
      t.timestamps
    end
  end
end
