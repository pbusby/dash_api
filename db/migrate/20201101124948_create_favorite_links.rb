class CreateFavoriteLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_links do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
