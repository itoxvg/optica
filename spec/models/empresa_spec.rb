require 'rails_helper'

RSpec.describe Empresa, type: :model do
  it { should validate_presence_of :nombre }
end
