class CreateFavoriteRoasters < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_roasters do |t|
      t.integer :user_id
      t.integer :roaster_id

      t.timestamps
    end
  end
end
