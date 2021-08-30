class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :account
  belongs_to :account_destiny, class_name: "Account", foreign_key: "account_destiny_id", optional: true

  validate :equals_accounts

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

  validate :not_enough_balance, if: :withdraw?

  def not_enough_balance
    errors.add(:transaction, "not enough balance") if user.total_balance <= 0.00 || self.amount >= user.total_balance
  end

  # def not_enough_limit
  #   errors.add(:transaction, "not enough limit") if 
  # end

  def equals_accounts
    errors.add(:account, "can't transfer to same account") if self.account_id == self.account_destiny_id
  end

end
