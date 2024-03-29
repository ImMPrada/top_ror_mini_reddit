class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :content, null: false
      t.belongs_to :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
