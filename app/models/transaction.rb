class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :account
  belongs_to :account_destiny, class_name: "Account", foreign_key: "account_destiny_id", optional: true

  enum transaction_type:{
    deposit: 0,
    withdraw: 1,
    reversal: 2,
    transfer: 3
  }

  validates :date, presence: true
  validates :amount, presence: true, numericality: true
  validates :transaction_type, presence: true
  validates :account_id, presence: true
  validates :user_id, presence: true
  validates :account_destiny_id, presence: true, if: :transfer?
  validate :validate_balance, if: :withdraw, :transfer?

  def validate_balance
      errors.add(:total_balance, "Not enough money") if (self.total_balance - self.amount) < 0.00
  end

end
