class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.date :date
      t.decimal :amount
      t.integer :transaction_type
      t.integer :account_id
      t.integer :user_id

      t.timestamps
    end
  end
end
