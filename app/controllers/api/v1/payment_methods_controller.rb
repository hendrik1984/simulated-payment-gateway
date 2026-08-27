class Api::V1::PaymentMethodsController < ApplicationController
  def index
    @payment_methods = PaymentMethod.where(enabled: true).order(:name)

    render json: {
      payment_methods: @payment_methods.as_json(
        only: [:id, :name, :code]
      )
    }
  end
end
