# frozen_string_literal: true

class QuotationsController < ApplicationController
  before_action :set_quotation, only: %i[edit update destroy]
  before_action :authenticate_user!

  def index
    @quotations = Quotation.all
  end

  def new
    @quotation = Quotation.new
  end

  def create
    @quotation = Quotation.new(quotation_params)

    if @quotation.save
      redirect_to quotations_path
    else
      render json: @quotation.errors, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if params[:quotation][:value].to_i >= params[:quotation][:minimal_sale_value].to_i
      if @quotation.update(quotation_params)
        redirect_to quotations_path
      else
        render json: @quotation.errors, status: :unprocessable_entity
      end
    else
      render json: 'Não Autorizado', status: :unprocessable_entity
    end
  end

  def destroy
    @quotation.destroy
    redirect_to quotations_path
  end

  private

  def set_quotation
    @quotation = Quotation.find(params[:id])
  end

  def quotation_params
    params.require(:quotation).permit(:name, :value, :installments, :discount, :finder_commission, :suggested_price_manufactures, :factory_cost, :credit_card_fee, :result)
  end
end
