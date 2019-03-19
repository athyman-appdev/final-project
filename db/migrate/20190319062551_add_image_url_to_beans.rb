class AddImageUrlToBeans < ActiveRecord::Migration[5.1]
  def change
    add_column :beans, :image_url, :string
  end
end
