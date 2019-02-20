require 'rails_helper'

RSpec.describe Cliente, type: :model do
  it { should have_many :ventas }

  it { should validate_presence_of :nombre }
end
