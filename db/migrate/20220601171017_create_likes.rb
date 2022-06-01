class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, index: {:unique=>true}, null: false, foreign_key: true
      t.belongs_to :likeable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
