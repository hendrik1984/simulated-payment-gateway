class PaymentTransaction < ApplicationRecord
  belongs_to :payment_method

  before_validation :generate_processing_delay, on: :create

  validates :reference, presence: true, uniqueness: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :currency, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending successful failed] }

  private
  def generate_processing_delay
    # self.processing_delay_seconds ||= rand(120..600)
    self.processing_delay_seconds ||= rand(10..40)
  end
end
