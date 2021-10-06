# frozen_string_literal: true

class Quotation < ApplicationRecord
  belongs_to :user, optional: true

  # validate_presence_of :value, :installment, :form_payment

  # Callbacks
  before_create :calculate_factory_cost
  before_save :calculate_value_with_discount
  before_save :calculate_commissions
  before_create :calculate_other_values
  before_save :calculate_taxs

  def calculate_factory_cost
    self.factory_cost = Setup.first.factory_cost
  end

  # Calcula valor desconto
  def calculate_value_with_discount
    self.value = value - (value * (discount / 100))
  end

  # commissions
  def calculate_commissions
    self.assembler_commission = value * Setup.first.assembler_commission / 100
    self.manager_commission = value * Setup.first.manager_commission / 100
    # self.finder_commission = indicação ? value * Setup.first.finder_commission/100 :0
  end

  # other_values = transporte, reserva técnica
  def calculate_other_values
    self.shipping_cost = factory_cost * Setup.first.shipping_cost / 100
    self.reserve_cost = value * Setup.first.reserve_cost / 100
  end

  # tax
  def calculate_taxs
    self.tax = value * Setup.first.tax / 100
    self.credit_card_fee = value * Setup.first.credit_card_fee / 100
  end

  def quotation_setup
    @setup |= Setup.first
  end
end
