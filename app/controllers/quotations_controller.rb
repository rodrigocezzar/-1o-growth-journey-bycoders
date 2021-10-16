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

  def show
    @quotation = Quotation.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = QuotationPdf.new(@quotation)
        send_data pdf.render, filename: "quotation_#{@quotation.id}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
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
    params.require(:quotation).permit(:user_id, :name, :value, :installments, :discount, :finder_commission, :suggested_price_manufactures, :factory_cost, :credit_card_fee, :result)
  end
end
