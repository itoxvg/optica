require 'rails_helper'

RSpec.describe "empresas/edit", type: :view do
  before(:each) do
    @empresa = assign(:empresa, Empresa.create!(
      :nombre => "MyString",
      :rfc => "MyString",
      :eslogan => "MyString",
      :logotipo => "MyString"
    ))
  end

  it "renders the edit empresa form" do
    render

    assert_select "form[action=?][method=?]", empresa_path(@empresa), "post" do

      assert_select "input[name=?]", "empresa[nombre]"

      assert_select "input[name=?]", "empresa[rfc]"

      assert_select "input[name=?]", "empresa[eslogan]"

      assert_select "input[name=?]", "empresa[logotipo]"
    end
  end
end
