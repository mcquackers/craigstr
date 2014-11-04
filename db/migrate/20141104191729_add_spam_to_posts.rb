class AddSpamToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :spam, :boolean, null: false, default: false
  end
end
