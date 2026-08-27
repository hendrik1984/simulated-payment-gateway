class PaymentMethodsController < ApplicationController
  def index
    @payment_methods = PaymentMethod.order(:name)
  end

  def toggle
    @payment_method = PaymentMethod.find(params[:id])
    @payment_method.update!(enabled: !@payment_method.enabled)

    redirect_to payment_methods_path
  end
end
