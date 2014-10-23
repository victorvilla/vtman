class AddMultipleRelationsToGuideSparkUsersinTask < ActiveRecord::Migration
  def change
     remove_column :tasks, :guidespark_user_id, :integer
     add_column :tasks, :writer_id, :integer, references: :guidespark_user
     add_column :tasks, :content_ops_id, :integer, references: :guidespark_user
  end
end