# frozen_string_literal: true

class Quotation < ApplicationRecord
  belongs_to :user, optional: true

  # validate_presence_of :value, :installment, :form_payment

  # Callbacks
  before_save :calculate_factory_cost
  before_save :minimal_sale_value
  before_save :calculate_value_with_discount
  before_save :calculate_commissions
  before_save :calculate_other_values
  before_save :calculate_taxs
  before_save :seller_commission
  before_save :result
  before_save :minimal_percent

  def calculate_factory_cost
    self.factory_cost = suggested_price_manufactures * Setup.first.cost_index / 100
  end

  def minimal_sale_value
    if suggested_price_manufactures <= 50000
      self.minimal_sale_value = suggested_price_manufactures * 0.59595
    elsif suggested_price_manufactures <= 80000
      self.minimal_sale_value = suggested_price_manufactures * 0.60714
    elsif suggested_price_manufactures <= 120000
      self.minimal_sale_value = suggested_price_manufactures * 0.61876
    else suggested_price_manufactures > 120001
      self.minimal_sale_value = suggested_price_manufactures * 0.63083
    end
  end

  # Calcula valor desconto
  def calculate_value_with_discount
    self.value = value - (value * (discount / 100))
  end

  def seller_commission
    if value <= 50000
      self.seller_commission = value * 4 / 100
    elsif value <= 80001
      self.seller_commission = value * 5 / 100
    elsif value <= 120000
      self.seller_commission = value * 6 / 100
    else value > 120001
      self.seller_commission = value * 7 / 100
    end
  end
  
  # commissions
  def calculate_commissions
    self.assembler_commission = value * Setup.first.assembler_commission / 100
    self.manager_commission = value * Setup.first.manager_commission / 100
    self.finder_commission = finder_commission
  end

  # other_values = transporte, reserva técnica
  def calculate_other_values
    self.shipping_cost = factory_cost * Setup.first.shipping_cost / 100
    self.reserve_cost = value * Setup.first.reserve_cost / 100
  end

  # tax
  def calculate_taxs
    self.tax = value * Setup.first.tax / 100
    self.credit_card_fee = credit_card_fee
  end
  
  def result
    if value > 1
      self.result = (value - factory_cost - seller_commission - assembler_commission - manager_commission -
                     shipping_cost - credit_card_fee - finder_commission - reserve_cost - tax)
      end    
  end

  def minimal_percent
    if value > 1
     self.minimal_percent = ((result / value) * 100).ceil
    end    
  end

  # def quotation_setup
  #   @setup |= Setup.first
  # end
end

