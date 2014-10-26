class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :event_type
      t.string :feedback
      t.references :task, index: true

      t.timestamps
    end
  end
end
