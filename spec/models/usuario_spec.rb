require 'rails_helper'

RSpec.describe Usuario, type: :model do
  it { should have_many :armazones }
  it { should have_many :lentes }
  it { should have_many :micas }

  it { should validate_presence_of :nombre }
  it { should validate_uniqueness_of(:nombre).case_insensitive }
end
