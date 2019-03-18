class CreateRoasters < ActiveRecord::Migration[5.1]
  def change
    create_table :roasters do |t|
      t.string :roaster_name
      t.string :roaster_location
      t.string :shipping_options
      t.string :roaster_description

      t.timestamps
    end
  end
end
