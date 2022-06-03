class RemoveIndexCommentsOnPostId < ActiveRecord::Migration[7.0]
  def change
    remove_index :comments, :post_id
  end
end
