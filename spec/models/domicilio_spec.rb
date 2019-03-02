require 'rails_helper'

RSpec.describe Domicilio, type: :model do
  it { should belong_to :domiciliable }

  it { should validate_presence_of :pais }
  it { should validate_presence_of :estado }
end
