class CreateJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :idiomas, :users do |t|
       t.index [:idioma_id, :user_id]
      t.index [:user_id, :idioma_id]
    end
  end
end
