class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :number
      t.decimal :limit
      t.references :agency, foreign_key: true

      t.timestamps
    end
  end
end
