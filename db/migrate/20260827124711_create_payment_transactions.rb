class CreatePaymentTransactions < ActiveRecord::Migration[8.1]
  def change
    create_table :payment_transactions do |t|
      t.string :reference, null: false
      t.decimal :amount, precision: 20, scale: 2, null: false
      t.string :currency, null: false
      t.string :status, null: false, default: "pending"
      t.references :payment_method, null: false, foreign_key: true

      t.timestamps
    end

    add_index :payment_transactions, :reference, unique: true
  end
end
