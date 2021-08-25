class AddAccountDestinyToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :account_destiny_id, :integer
  end
end
