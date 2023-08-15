class CreateJoinTablePostsProducts < ActiveRecord::Migration[7.0]
  def change
    create_join_table :posts, :products do |t|
      t.index [:post_id, :product_id]
      t.index [:product_id, :post_id]
    end
  end
end
