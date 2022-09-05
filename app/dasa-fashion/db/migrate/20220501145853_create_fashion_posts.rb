class CreateFashionPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :fashion_posts do |t|
      t.string :user_id
      t.float :point
      t.timestamps
    end
  end
end
