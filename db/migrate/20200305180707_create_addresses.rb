class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :street_number
      t.string :street_name
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
