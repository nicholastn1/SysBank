class Account < ApplicationRecord
    belongs_to :agency
    has_many :transactions
end
