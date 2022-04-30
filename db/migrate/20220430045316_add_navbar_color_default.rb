class AddNavbarColorDefault < ActiveRecord::Migration[7.0]
  def change
    change_column :settings, :navbar_color, :string, default: '#ff00ff'
  end
end
