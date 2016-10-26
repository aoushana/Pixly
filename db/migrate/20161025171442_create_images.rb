class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :link
      t.string :user_id
      t.integer :datetime

      t.timestamps
    end
  end
end
