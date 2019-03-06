[![Build Status](https://semaphoreci.com/api/v1/projects/b73bdec0-2d88-4ce0-aa85-91a8e559cef9/2550590/badge.svg)](https://semaphoreci.com/itox/optica)

OPTICA
======

Es un punto de venta de lentes, armazones, micas y tratamientos.

## Requisitos
  * ruby 2.6.1
  * rails 5.2.2
  * postgres
  * [minimagick](https://github.com/minimagick/minimagick)
  * node 11.1.0
  * yarn 1.13.0

## Instalación
```sh
git clone https://github.com/JuanVqz/optica.git
cd optica
bundle install

yarn install
```

## Ejecutar la aplicación
```sh
rails db:create
rails db:migrate
rails db:seed

// iniciar dos procesos
rails serve
./bin/webpack-dev-server

// ó usar foreman
foreman start
```

## Ejecutar las pruebas
```sh
rails db:test:load
rails db:test:prepare
rake
```
