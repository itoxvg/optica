class CreateProductos < ActiveRecord::Migration[5.2]
  def change
    create_table :productos do |t|
      t.string :nombre, default: "", null: false
      t.string :codigo, default: "", null: false
      t.text :descripcion
      t.money :precio_venta, default: 0
      t.money :precio_compra, default: 0
      t.float :existencia, default: 1
      t.string :tipo
      t.string :type

      t.timestamps
    end
  end
end
