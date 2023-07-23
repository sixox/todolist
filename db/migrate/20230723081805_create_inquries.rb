class CreateInquries < ActiveRecord::Migration[7.0]
  def change
    create_table :inquries do |t|
      t.string :full_name
      t.string :email
      t.string :phone
      t.string :company
      t.string :product
      t.integer :quantity
      t.string :country
      t.string :port
      t.string :packing

      t.timestamps
    end
  end
end
