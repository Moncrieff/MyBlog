class RemoveAttachmentFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :attachment, :string
  end
end
