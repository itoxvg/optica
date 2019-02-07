class CreateVendidos < ActiveRecord::Migration[5.2]
  def change
    create_table :vendidos do |t|
      t.references :venta, foreign_key: true
      t.references :producto, foreign_key: { to_table: :productos }
      t.integer :cantidad, default: 1, null: false
      t.money :precio, default: 0, null: false
      t.money :descuento, default: 0, null: false
      t.money :subtotal, default: 0, null: false
      t.text :observaciones

      t.timestamps
    end
  end
end
