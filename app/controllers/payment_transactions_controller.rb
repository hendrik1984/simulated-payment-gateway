class PaymentTransactionsController < ApplicationController
  def index
    @payment_transactions = PaymentTransaction
      .includes(:payment_method)
      .order(created_at: :desc)
      .page(params[:page])
      .per(5)

    if params[:q].present?
      search = "%#{params[:q]}%"

      @payment_transactions = @payment_transactions.where(
        "reference ILIKE :search OR currency ILIKE :search",
        search: search
      )
    end

    @payment_transactions = @payment_transactions.page(params[:page]).per(5)
  end
end
