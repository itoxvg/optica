module Codigo
  class Siguiente
    LARGO_DE_CODIGO = 7

    def asignar model
      return model.codigo = "V0000001" if es_primer_registro?
      model.codigo = asignar_codigo
    end

    def es_primer_registro?
      Venta.count < 1
    end

    def asignar_codigo
      buscar_codigo
    end

    def buscar_codigo
      elimina_prefijo Venta.last.codigo
    end

    def elimina_prefijo codigo
      sumar_uno codigo.delete('V')
    end

    def sumar_uno codigo
      aplicar_formato codigo.to_i + 1
    end

    def aplicar_formato codigo
      codigo_con_ceros = codigo.to_s.rjust(LARGO_DE_CODIGO, '0')
      "#{Venta::PREFIJO_CODIGO}#{codigo_con_ceros}"
    end
  end
end
