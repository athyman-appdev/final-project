class AddWebsiteUrlToRoasters < ActiveRecord::Migration[5.1]
  def change
    add_column :roasters, :website_url, :string
  end
end
