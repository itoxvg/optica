json.extract! cliente, :id, :nombre, :telefono, :rfc

json.set! :domicilio_attributes, cliente.domicilio
