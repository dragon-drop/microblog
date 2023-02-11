class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :voteable, polymorphic: true, null: false
      t.integer :state, default: 0

      t.timestamps
    end

    add_index(:votes, [:user_id, :voteable_id, :voteable_type], unique: true)
  end
end
