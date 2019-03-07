json.extract! @venta, :id, :codigo, :observaciones, :saldada, :fecha_entrega,
  :descuento, :total, :created_at, :updated_at
json.set! :cliente, @venta.cliente
json.set! :anticipo, @venta.suma_anticipos
json.set! :deuda, @venta.deuda
json.vendidos_attributes do
  json.array! @venta.vendidos, partial: 'vendidos/vendido', as: :vendido
end
json.pagos_attributes do
  json.array! [@venta.pagos.build], partial: 'pagos/pago', as: :pago
end
