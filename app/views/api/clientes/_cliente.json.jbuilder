json.extract! cliente, :id, :nombre, :telefono, :rfc

json.set! :domicilio_attributes, cliente.domicilio
json.set! :corporacion, cliente.corporacion.nombre
