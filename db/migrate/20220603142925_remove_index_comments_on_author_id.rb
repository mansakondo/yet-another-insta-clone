class RemoveIndexCommentsOnAuthorId < ActiveRecord::Migration[7.0]
  def change
    remove_index :comments, :author_id
  end
end
