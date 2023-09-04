class CreateSeoTags < ActiveRecord::Migration[7.0]
  def change
    create_table :seo_tags do |t|
      t.string :title
      t.text :description
      t.string :keywords
      t.integer :taggable_id
      t.string :taggable_type

      t.timestamps
    end
  end
end
