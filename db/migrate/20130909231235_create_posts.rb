class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :format
      t.text :content
      t.integer :width
      t.integer :height
      t.integer :width_thumbnail
      t.integer :height_thumbnail
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
