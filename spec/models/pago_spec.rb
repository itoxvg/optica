require 'rails_helper'

RSpec.describe Pago, type: :model do
  it { should belong_to :venta }

  it { should validate_presence_of :efectivo }
  it { should validate_presence_of :anticipo }
  it { should validate_presence_of :cambio }

  it { should_not allow_value(0).for(:efectivo) }
  it { should_not allow_value(0).for(:anticipo) }
end
