class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :kind
      t.string :category
      t.string :tag

      t.timestamps
    end
  end
end
