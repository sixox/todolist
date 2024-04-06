class AddSlugToGrades < ActiveRecord::Migration[7.0]
  def change
    add_column :grades, :slug, :string
    add_index :grades, :slug, unique: true
  end
end
