class VentaPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def deuda?
    user.admin? or user.vendedor? and not record.saldada?
  end

end
