class PaymentMethod < ApplicationRecord
    has_many :payment_transactions
    
    validates :name, presence: true
    validates :code, presence: true, uniqueness: true
end
