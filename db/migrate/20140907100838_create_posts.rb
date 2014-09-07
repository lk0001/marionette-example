class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :author, null: false
      t.string :content, null: false

      t.timestamps
    end
  end
end
