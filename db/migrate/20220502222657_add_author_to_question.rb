class AddAuthorToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :author, references: :users, index: true
    add_foreign_key :questions, :users, column: :author_id
  end
end
