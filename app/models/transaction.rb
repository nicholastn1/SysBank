class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :account
  belongs_to :account_destiny, class_name: "Account", foreign_key: "account_destiny_id", optional: true

  validate :equals_accounts

  enum transaction_type:{
    deposit:  0,
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
  validate :not_enough_limit
  validate :account_balance_validation

  def not_enough_balance
    errors.add(:transaction, "not enough balance") if user.total_balance <= 0.00 || self.amount >= user.total_balance
  end

  def account_balance_validation
    errors.add(:transaction, "insufficient account balance: $ #{account.account_balance}") if self.amount > account.account_balance
  end

  def not_enough_limit
    unless deposit?
      errors.add(:account, "greater than limit: $ #{account.limit}") if self.amount > account.limit
    end
  end

  def equals_accounts
    errors.add(:account, "can't transfer to same account") if self.account_id == self.account_destiny_id
  end

end
