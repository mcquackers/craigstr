class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.integer :region_id
      t.integer :user_id

      t.timestamps
    end

    add_index :posts, :region_id
  end
end
