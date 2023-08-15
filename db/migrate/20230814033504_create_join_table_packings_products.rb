class CreateJoinTablePackingsProducts < ActiveRecord::Migration[7.0]
  def change
    create_join_table :packings, :products do |t|
      t.index [:packing_id, :product_id]
      t.index [:product_id, :packing_id]
    end
  end
end
