class AddHashtoVoicetalentUser < ActiveRecord::Migration
  def change
    add_column :voice_talent_users, :nickname , :string
    add_column :voice_talent_users, :digest, :string
  end
end
