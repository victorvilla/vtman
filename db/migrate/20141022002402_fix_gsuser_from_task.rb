class FixGsuserFromTask < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.remove :cops
      t.integer :guidespark_user_id
      t.index :guidespark_user_id
    end
    
    #remove_column :tasks, :cops
    #add_column :tasks, :guidespark_user_id, :integer
    #add_index :tasks, :guidespark_user_id
  end
end
