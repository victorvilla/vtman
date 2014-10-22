class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :title
      t.string :file
      t.integer :asset_type, default: 0, :limit => 1 #Small integer
      t.string :s3_id
      t.string :s3_date
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :status, default: 0, :limit => 1 #Small integer
      t.references :task, index: true


      t.timestamps
    end
  end
end
