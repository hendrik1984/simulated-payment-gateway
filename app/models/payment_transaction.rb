class PaymentTransaction < ApplicationRecord
  belongs_to :payment_method

  validates :reference, presence: true, uniqueness: true
  validates :amount, presence: true
  validates :currency, presence: true
  validates :status, presence: true

end
