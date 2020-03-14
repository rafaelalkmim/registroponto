class CreateHorarios < ActiveRecord::Migration[5.2]
  def change
    create_table :horarios do |t|
      t.date :data
      t.time :entrada1
      t.time :saida1
      t.time :entrada2
      t.time :saida2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
