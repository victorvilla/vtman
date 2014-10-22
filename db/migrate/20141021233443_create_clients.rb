class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.boolean :is_active, default:1
      t.string :email
      t.string :phone

      t.timestamps
    end
    add_index :clients, :is_active
  end
end
