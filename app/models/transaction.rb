class Transaction < ApplicationRecord
    belongs_to :user
    belongs_to :account

    enum transaction_type:{
       deposit: 0,
       draft: 1,
       reversal: 2,
       transfer: 3
    }
end
