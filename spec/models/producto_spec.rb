require 'rails_helper'

RSpec.describe Producto, type: :model do
  it { should validate_presence_of(:nombre) }
  it { should validate_presence_of(:codigo) }
  it { should validate_presence_of(:existencia) }
  it { should validate_presence_of(:precio_venta) }
  it { should validate_presence_of(:precio_compra) }

  it { should_not allow_value(0).for(:precio_venta) }
  it { should_not allow_value(0).for(:precio_compra) }

  it { should validate_uniqueness_of(:codigo).case_insensitive }
end
