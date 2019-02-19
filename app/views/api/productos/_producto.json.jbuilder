json.extract! producto, :nombre, :codigo, :descripcion, :precio_venta,
  :precio_compra, :existencia, :tipo, :type

json.set! :producto_id, producto.id
json.set! :cantidad, 1
json.set! :descuento, 0
json.set! :subtotal, 0

