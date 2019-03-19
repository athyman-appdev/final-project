class RemoveImageUrlFromBeans < ActiveRecord::Migration[5.1]
  def change
    remove_column :beans, :image_url, :string
  end
end
