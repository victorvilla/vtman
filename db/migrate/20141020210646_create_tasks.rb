class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :vtn
      t.string :cops
      t.string :client
      t.string :video_title
      t.integer :type_script
      t.integer :number_chapters
      t.string :notes
      t.boolean :rush
      t.decimal :rate
      t.datetime :due_date
      t.integer :vt_file_id
      t.integer :status

      t.timestamps
    end
    add_index :tasks, :due_date
    add_index :tasks, :status
  end
end
