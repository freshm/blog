class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.string :content

      t.timestamps
    end
    add_index :blog_posts, [:created_at]
  end
end
