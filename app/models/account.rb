class Account < ApplicationRecord
  belongs_to :agency
  has_many :transactions

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
end
