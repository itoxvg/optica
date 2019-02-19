json.items do
  json.array! @productos, partial: 'api/productos/producto', as: :producto
end

json.set! :total_items, @productos.total_count

