require 'rails_helper'

RSpec.describe Venta, type: :model do
  it { should belong_to :cliente }
  it { should belong_to :usuario }
  it { should have_many(:vendidos).dependent(:destroy) }
  it { should have_many(:productos).through :vendidos }


  it { should accept_nested_attributes_for :vendidos }
  it { should accept_nested_attributes_for :cliente }

  it { should validate_presence_of :folio }
  it { should validate_presence_of :cliente }

  it { should validate_uniqueness_of(:folio).case_insensitive }

  it { should_not allow_value(0).for(:total) }
end
