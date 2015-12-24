class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :header
      t.integer :reading_time
      t.string :excerpt
      t.text :body

      t.timestamps null: false
    end
  end
end
