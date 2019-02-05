# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Usuario.create! nombre: 'juan', telefono: '951 123 45 67',
  email: 'admin@gmail.com', password: '123123123', cargo: 'admin'

Usuario.create! nombre: 'vendedor', telefono: '951 123 45 67',
  email: 'vendedor@gmail.com', password: '123123123', cargo: 'vendedor'

Usuario.create! nombre: 'cliente', telefono: '951 123 45 67',
  email: 'cliente@gmail.com', password: '123123123', cargo: 'cliente'

50.times do |n|
  tipo = ['ranurado', 'armazón completo', 'sobrepuesto'].sample
  precio_venta = rand (1 ..900)
  precio_compra = rand (1 ..900)

  Producto.create! nombre: "Armazon#{n}", codigo: "AZ#{n}",
    precio_venta: precio_venta, precio_compra: precio_compra,
    tipo: tipo, type: 'Armazon', usuario: admin
end

50.times do |n|
  tipo = ['polarizado', 'filtro uv'].sample
  precio_venta = rand (1 ..900)
  precio_compra = rand (1 ..900)

  Producto.create! nombre: "Lente#{n}", codigo: "LT#{n}",
    precio_venta: precio_venta, precio_compra: precio_compra,
    tipo: tipo, type: 'Lente', usuario: admin
end

50.times do |n|
  tipo = ['bifocal', 'blande', 'cr'].sample
  precio_venta = rand (1 ..900)
  precio_compra = rand (1 ..900)

  Producto.create! nombre: "Mica#{n}", codigo: "MC#{n}",
    precio_venta: precio_venta, precio_compra: precio_compra,
    tipo: tipo, type: 'Mica', usuario: admin
end

