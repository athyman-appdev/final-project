class RemoveTitleFromRoasterReviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :roaster_reviews, :title, :string
  end
end
