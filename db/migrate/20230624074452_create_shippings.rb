class CreateShippings < ActiveRecord::Migration[6.1]
  def change
    create_table :shippings do |t|
      
      t.integer :custmer_id, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.string :zip_code, null: false

      t.timestamps
    end
  end
end
