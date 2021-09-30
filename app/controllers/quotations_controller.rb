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
    if @quotation.update(quotation_params)
      redirect_to quotations_path
    else
      render json: @quotation.errors, status: :unprocessable_entity
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
    params.require(:quotation).permit(:name, :value, :installments, :discount)
  end
end
