class AddTagsToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :tags, :text
  end
end
