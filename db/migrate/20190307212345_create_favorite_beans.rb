class CreateFavoriteBeans < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_beans do |t|
      t.integer :user_id
      t.integer :bean_id

      t.timestamps
    end
  end
end
