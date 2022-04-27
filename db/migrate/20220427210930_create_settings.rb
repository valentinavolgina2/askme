class CreateSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :settings do |t|
      t.string :navbar_color
      t.integer :user_id

      t.timestamps
    end
  end
end
