class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def artists?
    true
  end

  def update?
    # record - variable that we are trying to update. in this case instance of User bcs we are in UserPolicy
    # user - user that is logged in at the moment (= current_user)
    record == user
  end

  def thanks?
    true
  end

  def my_bookings?
    true
  end
end
