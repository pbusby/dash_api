class AddScoreToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :score, :integer 
  end
end