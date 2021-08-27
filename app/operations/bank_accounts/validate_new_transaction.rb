module BankAccounts

  class ValidateNewTransaction

    def initialize(amount:, transaction_type:, account_id:)
      @amount           = amount.try(:to_f)
      @transaction_type = transaction_type
      @account_id       = account_id
      @account          = Account.where(id: @account_id).first
      @errors           = []
    end

    def execute
      validate_existence_of_account
      validate_withdrawal

      @errors
    end

    private

    def validate_withdrawal
      if (@account.balance - @amount) < 0.00
        @errors << "Not enough limit"
      end
    end

    def validate_existence_of_account
      if @account.blank?
        @errors << "Account not found"
      end
    end

  end

end