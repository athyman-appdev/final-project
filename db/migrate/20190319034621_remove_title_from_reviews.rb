class RemoveTitleFromReviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :title, :string
  end
end
