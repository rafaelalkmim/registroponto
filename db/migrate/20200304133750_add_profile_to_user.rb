class AddProfileToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :area, foreign_key: true
    add_reference :users, :profile, foreign_key: true
    add_column :users, :name, :string
  end
end
