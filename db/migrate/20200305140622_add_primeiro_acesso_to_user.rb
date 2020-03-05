class AddPrimeiroAcessoToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :primeiro_acesso, :boolean, default: true
  end
end
