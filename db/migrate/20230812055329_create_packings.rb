class CreatePackings < ActiveRecord::Migration[7.0]
  def change
    create_table :packings do |t|
      t.string :name
      t.text :description
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
