class CreateVtFiles < ActiveRecord::Migration
  def change
    create_table :vt_files do |t|
      t.text :path_file
      t.integer :task_id
      t.integer :type
      #t.integer :status # TODO

      t.timestamps
    end
    
   # add_index :vt_files, :task_id
  end
end
