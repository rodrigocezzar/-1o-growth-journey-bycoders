# frozen_string_literal: true

class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @meu_nome = params[:nome]
  end
end
