class VentaPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def deuda?
    usuario.admin? or usuario.vendedor? and not registro.saldada?
  end

end
