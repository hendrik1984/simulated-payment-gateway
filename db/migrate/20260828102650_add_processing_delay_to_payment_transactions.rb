class AddProcessingDelayToPaymentTransactions < ActiveRecord::Migration[8.1]
  def change
    add_column :payment_transactions, :processing_delay_seconds, :integer
  end
end
