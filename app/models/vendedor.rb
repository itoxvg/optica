class Vendedor < Usuario
  before_create :establecer_cargo

  private

  def establecer_cargo
    self.cargo = 'vendedor'
  end
end
