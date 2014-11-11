class AddArchiveToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :deleted, :boolean, default: 0
  end
end
