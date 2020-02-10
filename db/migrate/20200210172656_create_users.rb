class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :description
      t.string :native
      t.string :practico
      t.string :photo
      t.belongs_to :comuna, foreign_key: true

      t.timestamps
    end
  end
end
