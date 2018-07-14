class CreateSpreePages < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_pages do |t|
      t.string :permalink
      t.string :title
      t.text :content
      t.string :meta_title
      t.string :meta_keywords
      t.text :meta_description
      t.timestamp :available_on
      t.timestamps
    end

    create_table :spree_blogs do |t|
      t.string :permalink
      t.string :title
      t.string :description
      t.integer :comment_status
      t.timestamps
    end

    create_table :spree_blog_posts do |t|
      t.references :blog
      t.string :slug
      t.string :title
      t.text :excerpt
      t.text :content
      t.string :meta_title
      t.string :meta_keywords
      t.text :meta_description
      t.integer :created_by
      t.timestamp :available_on
      t.timestamps
    end

    create_table :spree_blog_posts_comments do |t|
      t.references :blog_post
      t.integer :created_by
      t.string :state
      t.timestamps
    end
  end
end
