require 'rails_helper'

RSpec.describe "empresas/new", type: :view do
  before(:each) do
    assign(:empresa, Empresa.new(
      :nombre => "MyString",
      :rfc => "MyString",
      :eslogan => "MyString",
      :logotipo => "MyString"
    ))
  end

  it "renders new empresa form" do
    render

    assert_select "form[action=?][method=?]", empresas_path, "post" do

      assert_select "input[name=?]", "empresa[nombre]"

      assert_select "input[name=?]", "empresa[rfc]"

      assert_select "input[name=?]", "empresa[eslogan]"

      assert_select "input[name=?]", "empresa[logotipo]"
    end
  end
end
