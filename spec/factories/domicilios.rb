FactoryBot.define do
  factory :domicilio do
    calle { "MyString" }
    numero { "MyString" }
    colonia { "MyString" }
    codigo_postal { "MyString" }
    municipio { "MyString" }
    estado { "MyString" }
    pais { "MyString" }
    domiciliable_type { "MyString" }
    domiciliable_id { 1 }
  end
end
