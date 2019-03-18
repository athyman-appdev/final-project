class CreateBeans < ActiveRecord::Migration[5.1]
  def change
    create_table :beans do |t|
      t.string :country_of_origin
      t.string :processing_type
      t.string :flavor_profiles
      t.float :price
      t.integer :roaster_id

      t.timestamps
    end
  end
end
