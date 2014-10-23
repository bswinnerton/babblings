class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :width
      t.integer :height
      t.float :ratio

      t.timestamps
    end
  end
end
