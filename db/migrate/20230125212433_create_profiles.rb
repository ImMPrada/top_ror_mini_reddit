class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.text :username, null: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :profiles, :username, unique: true
  end
end
