json.data do
  json.extract! venta, :id, :codigo, :total
  json.url venta_url venta
end
