class AddUsuarioToProductos < ActiveRecord::Migration[5.2]
  def change
    add_reference :productos, :usuario, foreign_key: true
  end
end
