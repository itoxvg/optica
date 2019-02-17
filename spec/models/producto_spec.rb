require 'rails_helper'

RSpec.describe Producto, type: :model do
  it { should belong_to :usuario }
  it { should have_many :vendidos }
  it { should have_many(:ventas).through :vendidos }

  it { should validate_presence_of :nombre }
  it { should validate_presence_of :codigo }
  it { should validate_presence_of :existencia }
  it { should validate_presence_of :precio_venta }
  it { should validate_presence_of :usuario }
  it { should validate_presence_of :tipo }
  it { should validate_presence_of :type }

  it { should_not allow_value(0).for(:precio_venta) }

  it { should validate_uniqueness_of(:codigo).case_insensitive }

  describe ".buscar" do
    let!(:armazones) { create_list :armazon, 2, tipo: "sobrepuesto" }
    let!(:armazon) do
      create :armazon, nombre: "uno", codigo: "uno", tipo: "completo"
    end

    let!(:lentes) { create_list :lente, 2, tipo: "polarizado" }
    let!(:lente) do
      create :lente, nombre: "dos", codigo: "dos", tipo: "filtro uv"
    end

    let!(:micas) { create_list :mica, 2, tipo: "monofocal" }
    let!(:mica) do
      create :mica, nombre: "tres", codigo: "tres", tipo: "cr"
    end

    context "armazones" do
      it "returns tipo Armazon" do
        expect(Producto.buscar("Armazon").count).to eq 3
      end

      it "returns 1 by nombre" do
        expect(Producto.buscar("uno").count).to eq 1
      end

      it "returns 1 by codigo" do
        expect(Producto.buscar("uno").count).to eq 1
      end

      it "returns 1 by tipo" do
        expect(Producto.buscar("completo").count).to eq 1
      end
    end # context armazones

    context "lentes" do
      it "returns tipo Lente" do
        expect(Producto.buscar("Lente").count).to eq 3
      end

      it "returns 1 by nombre" do
        expect(Producto.buscar("dos").count).to eq 1
      end

      it "returns 1 by codigo" do
        expect(Producto.buscar("dos").count).to eq 1
      end

      it "returns 1 by tipo" do
        expect(Producto.buscar("filtro uv").count).to eq 1
      end
    end # context lentes

    context "micas" do
      it "returns tipo Mica" do
        expect(Producto.buscar("Mica").count).to eq 3
      end

      it "returns 1 by nombre" do
        expect(Producto.buscar("tres").count).to eq 1
      end

      it "returns 1 by codigo" do
        expect(Producto.buscar("tres").count).to eq 1
      end

      it "returns 1 by tipo" do
        expect(Producto.buscar("cr").count).to eq 1
      end
    end # context micas
  end # describe ".buscar"
end
