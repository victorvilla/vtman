class AddPasswordDigestToGuidesparkUser < ActiveRecord::Migration
  def change
    add_column :guidespark_users, :password_digest, :string
  end
end
