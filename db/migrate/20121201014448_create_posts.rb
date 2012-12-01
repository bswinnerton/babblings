class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
			t.integer :author
			t.boolean :is_deleted, :default => 0
			t.boolean :is_hidden, :default => 0
      t.timestamps
			t.string :post_type
			t.text :title
			t.text :content
			t.text :original_path
			t.integer :width
			t.integer :height
			t.integer :width_thumbnail
			t.integer :height_thumbnail
    end
  end
end
