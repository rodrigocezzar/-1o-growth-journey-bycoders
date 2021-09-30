# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @total_seller = @user.quotations.sum(:value)
    value = NegociationValue.where('min_value <= ?', @total_seller).where('max_value >= ?', @total_seller).first.comission
    @total = @total_seller * (value / 100)
  end
end
