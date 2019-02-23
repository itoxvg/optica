class Armazon < Producto
  TIPOS = {
    'Armazón Completo'       => 'armazón completo',
    'Armazón de Tres Piezas' => 'armazón de tres piezas',
    'Ranurado'               => 'ranurado',
    'Sobrepuesto'            => 'sobrepuesto'
  }

  validates :tipo, presence: true
end
