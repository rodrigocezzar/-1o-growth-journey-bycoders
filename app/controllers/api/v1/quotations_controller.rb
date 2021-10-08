# frozen_string_literal: true

module Api
  module V1
    class QuotationsController < ApplicationController
      before_action :set_quotation, only: %i[edit update destroy]
      # before_action :authenticate_user!

      def index
        @quotations = Quotation.all

        render status: :ok, json: { quotations: QuotationSerializer.new(@quotations).to_h }
      end

      def new
        @quotation = Quotation.new
      end

      def create
        @quotation = Quotation.new(quotation_params)

        if @quotation.save
          render status: :ok, json: { quotations: QuotationSerializer.new(@quotation).to_h }
        else
          render json: @quotation.errors, status: :unprocessable_entity
        end
      end

      def edit; end

      def update
        if @quotation.update(quotation_params)
          render status: :ok, json: { quotations: QuotationSerializer.new(@quotation).to_h }
        else
          render json: @quotation.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @quotation.destroy
        render status: :ok, json: { quotations: QuotationSerializer.new(@quotation).to_h }
      end

      private

      def set_quotation
        @quotation = Quotation.find(params[:id])
      end

      def quotation_params
        params.require(:quotation).permit(:name, :value, :installments, :discount, :user_id, :suggested_price_manufactures, :minimal_percent)
      end
    end
  end
end

