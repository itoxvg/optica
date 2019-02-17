json.resultados do
  json.array! @productos, partial: 'api/productos/producto', as: :producto
end

