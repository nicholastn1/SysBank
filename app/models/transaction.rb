class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :account

  enum transaction_types:{
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

end
