class ArtworkPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def paintings?
    true
  end

  def digital_art?
    true
  end

  def sculptures?
    true
  end
end
