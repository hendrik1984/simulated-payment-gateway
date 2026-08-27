class CreatePaymentMethods < ActiveRecord::Migration[8.1]
  def change
    create_table :payment_methods do |t|
      t.string :name
      t.string :code
      t.boolean :enabled

      t.timestamps
    end
  end
end
