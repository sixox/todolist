class AddSlugToPackings < ActiveRecord::Migration[7.0]
  def change
    add_column :packings, :slug, :string
    add_index :packings, :slug, unique: true
  end
end
