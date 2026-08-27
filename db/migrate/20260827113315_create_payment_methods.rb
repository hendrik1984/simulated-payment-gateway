class CreatePaymentMethods < ActiveRecord::Migration[8.1]
  def change
    create_table :payment_methods do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.boolean :enabled, null: false, default: true

      t.timestamps
    end

    add_index :payment_methods, :code, unique: true
  end
end
