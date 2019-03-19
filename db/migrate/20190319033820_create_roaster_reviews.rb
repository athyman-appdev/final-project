class CreateRoasterReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :roaster_reviews do |t|
      t.string :title
      t.string :body
      t.integer :user_id
      t.integer :roaster_id

      t.timestamps
    end
  end
end
