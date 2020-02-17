class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :sender, foreign_key: true
      t.references :recipient, foreign_key: true

      t.timestamps
    end
    add_foreign_key :likes, :users, column: :sender_id, primary_key: :id
    add_foreign_key :likes, :users, column: :recipient_id, primary_key: :id
  end
end
