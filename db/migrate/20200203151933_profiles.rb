class Profiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |p|
      p.string :description
    end
  end
end
