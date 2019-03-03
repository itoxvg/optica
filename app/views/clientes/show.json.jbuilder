json.extract! @cliente, :id, :nombre, :telefono

json.set! :domicilio_attributes, @cliente.domicilio
