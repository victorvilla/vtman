class RemovevtFileIdFromTask < ActiveRecord::Migration
  def change
  	 remove_column :tasks, :vt_file_id, :integer
  	 drop_table :vt_files
  end
end
