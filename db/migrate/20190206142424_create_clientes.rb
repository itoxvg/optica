class CreateClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :clientes do |t|
      t.string :nombre, default: "", null: false
      t.string :telefono

      t.timestamps
    end
  end
end
