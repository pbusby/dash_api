class CreateBestsellers < ActiveRecord::Migration[5.2]
  def change
    create_table :bestsellers do |t|
      t.string :title
      t.string :author
      t.string :photo
      t.string :publish_date
      t.string :rating

      t.timestamps
    end
  end
end
