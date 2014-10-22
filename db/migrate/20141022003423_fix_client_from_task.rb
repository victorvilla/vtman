class FixClientFromTask < ActiveRecord::Migration
  def change
    #remove_column :tasks, :client
    #add_column :tasks, :client_id, :integer
    #add_index :tasks, :client_id
    
    change_table :tasks do |t|
      t.remove :client
      t.integer :client_id
      t.index :client_id
    end
  end
end
