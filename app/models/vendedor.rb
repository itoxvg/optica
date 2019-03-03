class Vendedor < Usuario

  scope :recientes_primero, -> { Vendedor.order(created_at: :desc) }

end
