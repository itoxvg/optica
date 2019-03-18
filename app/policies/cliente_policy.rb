class ClientePolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    create?
  end

  def show?
    create?
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def create?
    usuario.admin? or usuario.vendedor?
  end

  def update?
    usuario.admin?
  end

end
