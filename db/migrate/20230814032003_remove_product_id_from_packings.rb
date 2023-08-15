class RemoveProductIdFromPackings < ActiveRecord::Migration[7.0]
  def change
    remove_reference :packings, :product, index: true, foreign_key: true


  end
end
