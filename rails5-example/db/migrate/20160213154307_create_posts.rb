class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :contents, null: false
      t.boolean :featured, default: false, null: false
      t.timestamps
    end
  end
end
