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
    transfer = transactions.reversal.sum(:amount).to_f

    (deposits - withdraws) + reversals
  end

end