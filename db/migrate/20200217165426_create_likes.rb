class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :sender, index: true, foreign_key: {to_table: :users}
      t.references :recipient, index: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
