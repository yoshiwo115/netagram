class CreateNetas < ActiveRecord::Migration[5.1]
  def change
    create_table :netas do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :image_id

      t.timestamps
    end
  end
end
