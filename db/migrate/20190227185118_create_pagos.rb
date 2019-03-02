class CreatePagos < ActiveRecord::Migration[5.2]
  def change
    create_table :pagos do |t|
      t.money :efectivo, default: 0
      t.money :anticipo, default: 0
      t.money :cambio, default: 0
      t.references :venta, foreign_key: true

      t.timestamps
    end
  end
end
