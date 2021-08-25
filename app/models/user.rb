class User < ApplicationRecord
  has_many :transactions
  has_many :accounts

  validates :email, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def total_balance
    deposits = transactions.deposit.sum(:amount).to_f
    withdraws = transactions.withdraw.sum(:amount).to_f
    reversals = transactions.reversal.sum(:amount).to_f
    origin_transfers = transactions.transfer.sum(:amount).to_f
    destiny_transfers = Transaction.transfer.where(account_destiny_id: accounts.pluck(:id)).sum(:amount).to_f

    (deposits + destiny_transfers) - reversals - withdraws - origin_transfers
  end

end