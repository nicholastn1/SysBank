class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :number
      t.decimal :limit
      t.integer :agency_id

      t.timestamps
    end
  end
end
