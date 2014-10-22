class FixVtnFromTask < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.remove :vtn
      t.integer :voice_talent_user_id
      t.index :voice_talent_user_id
    end
    
    #remove_column :tasks, :vtn
    #add_column :tasks, :voice_talent_user_id, :integer
    #add_index :tasks, :voice_talent_user_id
  end
end
