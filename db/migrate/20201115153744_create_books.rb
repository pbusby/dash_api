class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :photo
      t.references :user, foreign_key: true
      t.references :author, foreign_key: true
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
