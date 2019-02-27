module VentasHelper

  def estado_de_pago venta
    content_tag :span, class: "badge #{badge_saldada(venta)}" do
      venta.saldada? ? 'PAGADO' : 'PENDIENTE'
    end
  end

  private

  def badge_saldada venta
    venta.saldada? ? 'badge-primary' : 'badge-danger'
  end
end
