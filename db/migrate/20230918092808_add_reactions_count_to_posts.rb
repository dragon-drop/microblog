class AddReactionsCountToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :reactions_count, :integer, null: false, default: 0
  end
end
