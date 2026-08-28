class Api::V1::PaymentTransactionsController < ApplicationController
    include ApiAuthenticatable
    
    skip_forgery_protection
    
    def create
        payment_method = PaymentMethod.find_by(
            code: payment_transaction_params[:payment_method_code],
            enabled: true
        )

        unless payment_method
            return render json: {
                error: "Payment method is not available"
            }, status: :unprocessable_entity
        end

        payment_transaction = PaymentTransaction.new(
            reference: payment_transaction_params[:reference],
            amount: payment_transaction_params[:amount],
            currency: payment_transaction_params[:currency],
            payment_method: payment_method,
            status: "pending"
        )

        if payment_transaction.save
            render json: {
                id: payment_transaction.id,
                reference: payment_transaction.reference,
                amount: payment_transaction.reference,
                currency: payment_transaction.reference,
                payment_method: {
                    name: payment_method.name,
                    code: payment_method.code
                },
                status: payment_transaction.status
            }, status: :created
        else
            render json: {
                errors: payment_transaction.errors.full_messages
            }, status: :unprocessable_entity
        end
    end

    private

    def payment_transaction_params
        params.permit(
            :reference,
            :amount,
            :currency,
            :payment_method_code
        )
    end
end
