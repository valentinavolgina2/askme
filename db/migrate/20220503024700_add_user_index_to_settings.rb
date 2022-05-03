class AddUserIndexToSettings < ActiveRecord::Migration[7.0]
  def change
    add_index :settings, :user_id
  end
end
