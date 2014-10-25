class AddBackupContentToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :backup_content, :string
  end
end
