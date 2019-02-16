require 'rails_helper'

RSpec.describe Vendido, type: :model do
  it { should belong_to :venta }
  it { should belong_to :producto }

  it { should validate_presence_of :cantidad }
  it { should validate_presence_of :precio }
  it { should validate_presence_of :descuento }
  it { should validate_presence_of :subtotal }

  it { should_not allow_value(0).for(:cantidad) }
  it { should_not allow_value(0).for(:precio) }
  it { should_not allow_value(0).for(:subtotal) }
end
