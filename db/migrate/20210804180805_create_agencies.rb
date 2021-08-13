class CreateAgencies < ActiveRecord::Migration[5.2]
  def change
    create_table :agencies do |t|
      t.string :number
      t.text :address

      t.timestamps
    end
  end
end
