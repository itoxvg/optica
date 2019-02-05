require 'rails_helper'

RSpec.describe Usuario, type: :model do
  it { should have_many :productos }

  it { should validate_presence_of :nombre }
  it { should validate_uniqueness_of(:nombre).case_insensitive }
end
