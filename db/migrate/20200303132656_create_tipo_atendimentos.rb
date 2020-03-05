class CreateTipoAtendimentos < ActiveRecord::Migration[5.2]
  def change
    create_table :tipo_atendimentos do |t|
      t.text :descricao

      t.timestamps
    end
  end
end
