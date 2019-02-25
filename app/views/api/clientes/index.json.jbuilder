json.items do
  json.array! @clientes, partial: 'api/clientes/cliente', as: :cliente
end

json.set! :total_items, @clientes.total_count
