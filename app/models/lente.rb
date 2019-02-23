class Lente < Producto
  TIPOS = {
    'Filtro UV'  => 'filtro uv',
    'Polarizado' => 'polarizado'
  }

  validates :tipo, presence: true
end
