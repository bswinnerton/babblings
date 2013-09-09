class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :format
      t.text :content
      t.text :original_path
      t.integer :width
      t.integer :height
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
