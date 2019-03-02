require 'rails_helper'

RSpec.describe "empresas/show", type: :view do
  before(:each) do
    @empresa = assign(:empresa, Empresa.create!(
      :nombre => "Nombre",
      :rfc => "Rfc",
      :eslogan => "Eslogan",
      :logotipo => "Logotipo"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/Rfc/)
    expect(rendered).to match(/Eslogan/)
    expect(rendered).to match(/Logotipo/)
  end
end
