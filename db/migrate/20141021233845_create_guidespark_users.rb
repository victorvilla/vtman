class CreateGuidesparkUsers < ActiveRecord::Migration
  def change
    create_table :guidespark_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :is_active, default: 1
      t.integer :profile
      t.string :office_address
      t.string :office_phone

      t.timestamps
    end
    add_index :guidespark_users, :is_active
    add_index :guidespark_users, :profile
  end
end
