class RemoveIndexLikesOnAuthorId < ActiveRecord::Migration[7.0]
  def change
    remove_index :likes, :author_id
  end
end
