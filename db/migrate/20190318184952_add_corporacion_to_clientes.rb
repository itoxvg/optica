class AddCorporacionToClientes < ActiveRecord::Migration[5.2]
  def change
    add_reference :clientes, :corporacion, foreign_key: { to_table: :empresas }
  end
end
