class Account < ApplicationRecord
  belongs_to :agency
  belongs_to :user

  has_many :transactions, class_name: "Transaction", dependent: :restrict_with_exception

  validates :number, presence: true, uniqueness: true
  validates :limit, presence: true, numericality: true
  validates :agency_id, presence: true
  validates :balance, presence: true

  before_validation :load_defaults

  def load_defaults
      if self.new_record?
        self.balance = 0.00
      end
  end

  def format_description
    "CC: #{number.to_s} / AG: #{agency.number.to_s}"
  end

end
