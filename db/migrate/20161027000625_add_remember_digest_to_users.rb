class AddRememberDigestToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :RememberDigest, :string
  end
end
