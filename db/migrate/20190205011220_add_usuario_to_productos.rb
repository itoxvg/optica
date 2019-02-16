class AddUsuarioToProductos < ActiveRecord::Migration[5.2]
  def change
    add_reference :productos, :usuario, foreign_key: { to_table: :usuarios }
  end
end
