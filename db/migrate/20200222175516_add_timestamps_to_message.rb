class AddTimestampsToMessage < ActiveRecord::Migration[5.2]
  def change
  add_column :messages, :created_at, :datetime, null: false, default: Time.zone.now

  end
end
