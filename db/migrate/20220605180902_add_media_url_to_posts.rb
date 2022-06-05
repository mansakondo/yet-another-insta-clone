class AddMediaURLToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :media_url, :string
  end
end
