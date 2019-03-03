OPTICA
======

Es un punto de venta de lentes, armazones, micas y tratamientos.

## Requisitos
  * ruby 2.6.1
  * rails 5.2.2
  * postgres

## Instalación
```sh
git clone https://github.com/JuanVqz/optica.git
cd optica
bundle install
```

## Ejecutar la aplicación
```sh
rails db:create
rails db:migrate
rails db:seed
rails serve
```

## Ejecutar las pruebas
```sh
rails db:test:load
rails db:test:prepare
rake
```
