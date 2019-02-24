require 'rails_helper'

RSpec.describe Lente, type: :model do
  it { should validate_presence_of :tipo }
end
