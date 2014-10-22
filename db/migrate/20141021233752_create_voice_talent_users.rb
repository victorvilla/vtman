class CreateVoiceTalentUsers < ActiveRecord::Migration
  def change
    create_table :voice_talent_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :is_active, default: 1
      t.boolean :is_veteran, default: 0
      t.string :office_phone
      t.decimal :full_rate, default: 0.0
      t.decimal :rush_full_rate, default: 0.0
      t.decimal :partial_rate, default: 0.0
      t.decimal :rush_partial_rate, default: 0.0
      t.decimal :correction_rate, default: 0.0

      t.timestamps
    end
    add_index :voice_talent_users, :is_active
  end
end
