require 'rails_helper'

RSpec.describe Corporacion, type: :model do
  it { should have_many :clientes }
end
