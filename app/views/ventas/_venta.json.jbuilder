json.extract! venta, :id, :folio, :observaciones, :saldada, :fecha_entrega, :descuento, :total, :cliente_id, :usuario_id, :created_at, :updated_at
json.url venta_url(venta, format: :json)
