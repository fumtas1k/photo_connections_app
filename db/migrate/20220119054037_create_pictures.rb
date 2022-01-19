class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.text :image, null: false
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
