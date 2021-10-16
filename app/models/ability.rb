# frozen_string_literal: true

class Ability
  include CanCan::Ability

  # def initialize(user)
  #   if user.admin?
  #     can [:read], Quotations
  #   else
  #     can [:read, :update, :destroy], Quotation
  #     can [:read], User
  #   end
  # end
  # def initialize(user)
  #   user ||= User.new

  #   if user.admin?
  #     can [:read], Quotation
  #   else
  #     # non-admin abilities
  #   end
  # end
end
