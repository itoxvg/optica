require 'rails_helper'

RSpec.describe Cliente, type: :model do
  it { should have_many :ventas }
  it { should have_one(:domicilio).dependent(:destroy) }

  it { should validate_presence_of :nombre }
  it { should validate_uniqueness_of(:nombre).case_insensitive }
  it { should accept_nested_attributes_for(:domicilio).allow_destroy(true) }
end
