class AddImageUrlToRoasters < ActiveRecord::Migration[5.1]
  def change
    add_column :roasters, :image_url, :string
  end
end
